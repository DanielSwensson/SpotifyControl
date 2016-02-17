require "spotify_osx_controller/version"
require "spotify_osx_controller/search.rb"

module SpotifyOsxController

		def self.play(parameters = {})
			if !parameters.values.all? &:empty?
				search = Search.new(parameters)

				if search.any?
					uri = search.first.uri
					buildScript  "tell application \"Spotify\" to play track \"#{uri}\"\n"
				else 
					puts "Error: no results"
				end
			else 
				buildScript "tell application \"Spotify\" to play\n"
			end
		end 

		def self.play_pause
			buildScript String <<-END 
				tell application "Spotify" to playpause
			END
		end

		def self.stop
			pause
		end

		def self.pause
			buildScript "tell application \"Spotify\" to pause"
		end

		def self.next
			buildScript "tell application \"Spotify\" to next track"
		end

		def self.previous 
			buildScript "tell application \"Spotify\" to previous track"
		end

		def self.jump seconds
			return if !seconds
			buildScript String <<-END 
				tell application "Spotify"
					set jumpTo to #{seconds} as real
					set tMax to duration of current track
					if jumpTo > tMax
						return "Can't jump past end of track."
					else if jumpTo < 0
						return "Can't jump past start of track."
					end if
					set nM to round (jumpTo / 60) rounding down
					set nS to round (jumpTo mod 60) rounding down
					set newTime to nM as text & "min " & nS as text & "s"
					set player position to jumpTo
					return "Jumped to " & newTime
				end tell
			END
		end

		def self.forward seconds
			return if !seconds
			buildScript String <<-END 
				set jump to #{seconds} as real
				tell application "Spotify"
					set now to player position
					set tMax to duration of current track
					set jumpTo to now + jump
					if jumpTo > tMax
						return "Can't jump past end of track."
					else if jumpTo < 0
						set jumpTo to 0
					end if
					set nM to round (jumpTo / 60) rounding down
					set nS to round (jumpTo mod 60) rounding down
					set newTime to nM as text & "min " & nS as text & "s"
					set player position to jumpTo
					return "Jumped to " & newTime
				end tell
			END
		end

		def self.rewind seconds
			return if !seconds
			buildScript String <<-END 
				set jump to #{seconds} as real
				tell application "Spotify"
					set now to player position
					set tMax to duration of current track
					set jumpTo to now - jump
					if jumpTo > tMax
						return "Can't jump past end of track."
					else if jumpTo < 0
						set jumpTo to 0
					end if
					set nM to round (jumpTo / 60) rounding down
					set nS to round (jumpTo mod 60) rounding down
					set newTime to nM as text & "min " & nS as text & "s"
					set player position to jumpTo
					return "Jumped to " & newTime
				end tell
			END
		end

		def self.volume volume
			return if !volume
			buildScript String <<-END 
				set newVolume to #{volume} as real
				if newVolume < 0 then set newVolume to 0
				if newVolume > 100 then set newVolume to 100
				tell application "Spotify"
					set sound volume to newVolume
				end tell
				return "Changed volume to " & newVolume
			END
		end

		def self.shuffle 
			buildScript String <<-END 
				tell application "Spotify"
					set shuffling to not shuffling
					return "Shuffle is now " & shuffling
				end tell
			END
		end

		def self.repeat 
			buildScript String <<-END 
				tell application "Spotify"
					set repeating to not repeating
					return "Repeat is now " & repeating
				end tell
			END
		end


		def self.info 
			buildScript String <<-END 
				set info to "Error."
				 tell application "Spotify"
			        set myTrack to name of current track
			        set myArtist to artist of current track
			        set myAlbum to album of current track
			        set tM to round ((duration of current track / 1000) / 60) rounding down
			        set tS to round ((duration of current track / 1000) mod 60) rounding down
			        set myTime to tM as text & "min " & tS as text & "s"
			        set nM to round (player position / 60) rounding down
			        set nS to round (player position mod 60) rounding down
			        set nowAt to nM as text & "min " & nS as text & "s"
			        set info to "Current track:"
			        set info to info & "\n Artist:   " & myArtist
			        set info to info & "\n Track:    " & myTrack
			        set info to info & "\n Album:    " & myAlbum
			        set info to info & "\n URI:      " & spotify url of current track
			        set info to info & "\n Duration: " & mytime & " ("& (round ((duration of current track / 1000)) rounding down) & " seconds)"
			        set info to info & "\n Now at:   " & nowAt
			        set info to info & "\n Player:   " & player state
			        set info to info & "\n Volume:   " & sound volume
			        if shuffling then set info to info & "\n Shuffle is on."
			        if repeating then set info to info & "\n Repeat is on."
      			end tell
				return info
			END
		end	

		def self.info_json
			buildScript String <<-END 
				set info to "Error."
				tell application "Spotify" 
					set myTrack to name of current track
					set myArtist to artist of current track
					set myAlbum to album of current track
					set tM to round (duration of current track / 60) rounding down
					set tS to duration of current track mod 60
					set myTime to tM as text & "min " & tS as text & "s"
					set nM to round (player position / 60) rounding down
					set nS to round (player position mod 60) rounding down
					set nowAt to player position
					set info to "{"
					set info to info & "\\"artist\\":   \\"" & myArtist & "\\","
					set info to info & "\\"track\\":    \\"" & myTrack & "\\","
					set info to info & "\\"album\\":    \\"" & myAlbum & "\\","
					set info to info & "\\"URI\\":      \\"" & spotify url of current track & "\\","
					set info to info & "\\"duration\\": \\"" & duration of current track & "\\","
					set info to info & "\\"player\\":   \\"" & player state & "\\","
					set info to info & "\\"position\\":   \\"" & nowAt & "\\""
					set info to info & "}"
				end tell
				return info
			END
		end

		private 

		def self.buildScript(body) 
			header = "using terms from application \"Spotify\""
			footer = "end using terms from"
			osascript <<-END
				#{header} 
					#{body}
				#{footer} 
			END
		end

		def self.osascript(script) 
	  		system 'osascript', *script.split(/\n/).map { |line| ['-e', line] }.flatten
		end

end

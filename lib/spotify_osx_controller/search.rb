require "rspotify"

module SpotifyOsxController

	class Search

		def initialize (parameters = {})
			@track = parse parameters[:track]
			@artist = parse parameters[:artist]
			@album = parse parameters[:album]
			@query = construct_query
			@results = run_query
		end

		def any?
			@results.any?
		end

		def first
			@results.first
		end

		private 

		def run_query ()
			if @track.empty? 
				RSpotify::Album.search @query
			else
				RSpotify::Track.search @query
			end		 
		end

		def parse (array)
			array.join('+') if array
		end

		def construct_query
			query = ""
			query += "artist:#{@artist} " if !@artist.empty? 
			query += "track:#{@track} " if !@track.empty?
			query += "album:#{@album}" if !@album.empty?
			query
		end
	end


end
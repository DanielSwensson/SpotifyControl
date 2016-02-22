require "rspotify"

module SpotifyOsxController

	class Search

		def initialize (parameters = {})
			@track = parameters[:track]
			@artist = parameters[:artist]
			@album = parameters[:album]
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
			if !@track
				RSpotify::Album.search @query
			else
				RSpotify::Track.search @query
			end		 
		end

		def construct_query
			query = ""
			query += "artist:#{@artist} " if @artist
			query += "track:#{@track} " if @track
			query += "album:#{@album}" if @album
			query
		end
	end


end
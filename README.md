# SpotifyOsxController

CLI for Spotify running on OSX

Apple script forked from: [dronir/SpotifyControl](https://github.com/dronir/SpotifyControl)

## Command-line options

```
spotify_osx_controller [options] play [-t=<name>] [-a=<name>] [--A=<name>] 	Start playback
spotify_osx_controller [options] play-pause 						Play/pause playback
spotify_osx_controller [options] stop								Stop playback
spotify_osx_controller [options] next								Play next track
spotify_osx_controller [options] previous							Play previous track
spotify_osx_controller [options] jump [--seconds=<seconds>]			Jump to <seconds> of current track
spotify_osx_controller [options] forward [--seconds=<seconds>]		Jump <seconds> ahead
spotify_osx_controller [options] rewind [--seconds=<seconds>]		Rewind <seconds> backwards

	Where available [options] are the following:
  -v, --volume=<i>    Set playback volume to <i>, where <i> is number between 0 and 100
  -S, --shuffle       Toggle shuffle
  -R, --repeat        Toggle repeat
  -i, --info          Display information about the current track
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spotify_osx_controller'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spotify_osx_controller


## Contributing

1. Fork it ( https://github.com/[my-github-username]/spotify_osx_controller/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# SpotifyOsxController

CLI for Spotify running on OSX

Apple script forked from: [dronir/SpotifyControl](https://github.com/dronir/SpotifyControl)

## Command-line options

```
  -p, --play <s>:       Start playback of the given track, where <s> is the spotify URI
  -P, --play-pause:     Play/pause playback
  -s, --stop:           Stop playback
  -n, --next:           Play next track
  -N, --previous:       Play previous track
  -j, --jump <i>:       Jump to position given position of the current track, where <i> is track position in
                       	seconds
  -f, --forward <i>:    Jump <i> number of seconds ahead
  -r, --rewind <i>:     Rewind <i> number of seconds backwards
  -v, --volume <i>:     Set playback volume to <i>, where <i> is number between 0 and 100
  -S, --shuffle:        Toggle shuffle
  -R, --repeat:         Toggle repeat
  -i, --info:           Display information about the current track
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

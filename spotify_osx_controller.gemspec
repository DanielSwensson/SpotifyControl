# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spotify_osx_controller/version'

Gem::Specification.new do |spec|
  spec.name          = "spotify_osx_controller"
  spec.version       = SpotifyOsxController::VERSION
  spec.authors       = ["Daniel Swensson"]
  spec.email         = ["daniel@danielswensson.se"]
  spec.licenses      = ['MIT']

  spec.summary       = %q{Ruby wrapper for Spotify applescript API}
  spec.description   = <<-EOF 
                        Run basic Spotify commands on OSX.
                        Apple script forked from: https://github.com/dronir/SpotifyControl
                       EOF
  spec.homepage      = "https://github.com/DanielSwensson/SpotifyControl"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "trollop"
  spec.add_dependency "rspotify"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

end
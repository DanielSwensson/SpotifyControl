# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spotify_osx_controller/version'

Gem::Specification.new do |spec|
  spec.name          = "spotify_osx_controller"
  spec.version       = SpotifyOsxController::VERSION
  spec.authors       = ["Daniel Swensson"]
  spec.email         = ["danielswensson@hotmail.com"]

  spec.summary       = %q{Ruby wrapper for Spotify applescript API}
  spec.description   = %q{Control Spotify running on a Mac in your ruby application.}
  spec.homepage      = "https://github.com/DanielSwensson/SpotifyControl"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
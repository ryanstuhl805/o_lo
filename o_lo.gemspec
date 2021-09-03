lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'o_lo/version'

Gem::Specification.new do |s|
  s.name               = 'o_lo'
  s.version            = Olo::VERSION
  s.platform           = Gem::Platform::RUBY
  s.summary            = 'Obvious Logger for use in development.'
  s.description        = 'Displays output in logs with decorators, making it easy to find in a log stream.'
  s.authors            = ["Ryan Stuhl"]
  s.email              = "designstuhltech@gmail.com"
  s.files              = `git ls-files`.split("\n")
  s.test_files         = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths      = ['lib']
  s.homepage           = 'https://rubygems.org/gems/o_lo'
  s.license            = 'MIT'
end

#
# dawn-git.gemspec
#
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'dawn/git/version'

Gem::Specification.new do |s|
  s.name        = 'dawn-git'
  s.summary     = 'Dawn Git'
  s.description = 'A REST-ful API for controlling git projects remotely, a replacement for gitlab-shell on dawn'
  s.homepage    = 'https://github.com/dawn/dawn-git'
  s.version     = Dawn::Git::Version::STRING
  s.platform    = Gem::Platform::RUBY
  s.date        = Time.now.to_date.to_s
  s.license     = 'MIT'
  s.authors     = ['Blaž Hrastnik', 'Corey Powell']

  s.add_runtime_dependency 'sshkey',      '~> 1.6'
  s.add_runtime_dependency 'excon',       '~> 0.36'
  s.add_runtime_dependency 'sinatra',     '~> 1.4'

  s.executables = 'dawn-git-server'
  s.require_path = 'lib'
  s.files = Dir.glob('lib/**/*') +
            Dir.glob('bin/**/*')
end

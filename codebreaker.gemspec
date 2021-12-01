# frozen_string_literal: true

require_relative 'lib/codebreaker/version'

Gem::Specification.new do |spec|
  spec.name = 'codebreaker'
  spec.version = Codebreaker::VERSION
  spec.authors = ['believerfenix']
  spec.email = ['us55554444us55554444@gmail.com']

  spec.summary = 'Codebreaker'
  spec.description = 'Codebreaker'
  spec.homepage = 'https://github.com/believerfenix/codebreaker'
  spec.license = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7')

  spec.metadata['allowed_push_host'] = ''

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/believerfenix/codebreaker'
  spec.metadata['changelog_uri'] = 'https://github.com/believerfenix/codebreaker'
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'fasterer', '~> 0.9.0'
  spec.add_development_dependency 'pry', '~> 0.14.1'
  spec.add_development_dependency 'rspec', '~> 3.10.0'
  spec.add_development_dependency 'rubocop', '~> 1.22.3'
  spec.add_development_dependency 'rubocop-performance', '~> 1.12.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.6.0'
  spec.add_development_dependency 'simplecov', '~> 0.21.2'
end

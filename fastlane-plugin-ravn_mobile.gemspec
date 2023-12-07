lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/ravn_mobile/version'

Gem::Specification.new do |spec|
  spec.name = 'fastlane-plugin-ravn_mobile'
  spec.version = Fastlane::RavnMobile::VERSION
  # TODO: Change contact information once published
  spec.author = 'quebin31'
  spec.email = 'kevindelcastillo@ravn.co'

  spec.summary = 'Utility actions for Fastlane build and deployment of Android and iOS apps for both native and cross platform implementations'
  spec.homepage = "https://github.com/ravn-hq/fastlane-plugin-ravn_mobile"
  spec.license = "MIT"

  spec.files = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.required_ruby_version = '>= 2.6'

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency('bundler')
  spec.add_development_dependency('fastlane', '>= 2.216.0')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rubocop', '1.50.2')
  spec.add_development_dependency('rubocop-performance')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')
end

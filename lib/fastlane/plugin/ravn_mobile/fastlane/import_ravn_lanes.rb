require 'fastlane'
require 'tmpdir'
require_relative '../util/util'

module Fastlane
  module FastFile

    # @param [String] platform Either 'android' or 'ios'
    # @param [String] version Same syntax as `import_from_git`
    def import_ravn_lanes(platform, version = nil)
      UI.user_error!("Invalid platform value #{platform}") unless %w[android ios].include?(platform)

      default_version = '~> 0.2'
      version = default_version if blank?(version)
      url = 'https://github.com/ravnhq/mobile-cicd'
      path = platform == 'android' ? 'lanes/android.rb' : 'lanes/ios.rb'
      dependencies = %w[lanes/util.rb]
      cache_path = Dir.mktmpdir('ravn_lanes')

      import_from_git(url: url, path: path, version: version, dependencies: dependencies, cache_path: cache_path)
    end
  end
end

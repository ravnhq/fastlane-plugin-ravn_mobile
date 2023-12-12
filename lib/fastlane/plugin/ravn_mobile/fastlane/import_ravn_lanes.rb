require 'fastlane'
require 'tmpdir'
require_relative '../util/util'

module Fastlane
  class FastFile
    def import_ravn_lanes(params)
      platform = params[:platform]
      UI.user_error!("Invalid platform value #{platform}") unless %w[android ios].include?(platform)

      default_version = '~> 0.2'
      version = params[:version]
      version = default_version if blank?(version)

      url = 'https://github.com/ravnhq/mobile-cicd'
      path = platform == 'android' ? 'lanes/android.rb' : 'lanes/ios.rb'
      dependencies = %w[lanes/util.rb]
      cache_path = Dir.mktmpdir('ravn_lanes')

      import_from_git(url: url, path: path, version: version, dependencies: dependencies, cache_path: cache_path)
    end
  end
end

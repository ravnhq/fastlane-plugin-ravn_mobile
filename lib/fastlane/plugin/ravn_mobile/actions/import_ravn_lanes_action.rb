require 'fastlane'
require 'tmpdir'
require_relative '../util/util'

module Fastlane
  module Actions
    class ImportRavnLanesAction < Action
      IMPORT_URL = 'https://github.com/ravnhq/mobile-cicd'
      IMPORT_VERSION = '~> 0.2'

      def self.run(params)
        platform = params[:platform]

        version = params[:version]
        version = blank?(version) ? ImportRavnLanesAction::IMPORT_VERSION : version

        url = ImportRavnLanesAction::IMPORT_URL
        path = platform == 'android' ? 'lanes/android.rb' : 'lanes/ios.rb'
        dependencies = %w[lanes/util.rb]
        cache_path = Dir.mktmpdir("ravn_lanes")

        other_action.import_from_git(url: url, path: path, version: version, dependencies: dependencies, cache_path: cache_path)
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Imports private lanes from RAVN mobile CI/CD repository'
      end

      def self.details
        'Imports private lanes from RAVN mobile CI/CD repository for a specific platform into a temporary directory'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :platform,
                                       env_name: 'FL_IMPORT_RAVN_LANES_PLATFORM',
                                       description: 'Platform lanes to import',
                                       type: String,
                                       verify_block: proc do |value|
                                         is_valid = %w[android ios].include?(value)
                                         UI.user_error!("Invalid platform value '#{value}'") unless is_valid
                                       end),
          FastlaneCore::ConfigItem.new(key: :version,
                                       env_name: 'FL_IMPORT_RAVN_LANES_VERSION',
                                       description: 'Version to import',
                                       type: String,
                                       default_value: ImportRavnLanesAction::IMPORT_VERSION)
        ]
      end

      def self.authors
        ['quebin31']
      end

      def self.is_supported?(platform)
        %i[ios android].include?(platform)
      end
    end
  end
end

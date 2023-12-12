require 'fastlane'

module Fastlane
  module Actions
    class ImportRavnLanesAction < Action
      def self.run(params)
        # implemented in ../fastlane/import_ravn_lanes.rb
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
                                       optional: true)
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

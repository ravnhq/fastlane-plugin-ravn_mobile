require 'fastlane'
require 'fastlane/actions/gradle'
require 'fastlane/actions/gym'
require_relative '../util/util'

module Fastlane
  module Actions
    module SharedValues
      COPIED_ARTIFACTS_OUTPUT_PATH = :COPIED_ARTIFACTS_OUTPUT_PATH
    end

    class CopyOutputArtifactsAction < Action
      def self.run(params)
        apk_output_paths = Actions.lane_context[SharedValues::GRADLE_ALL_APK_OUTPUT_PATHS]
        aab_output_paths = Actions.lane_context[SharedValues::GRADLE_ALL_AAB_OUTPUT_PATHS]
        mapping_output_paths = Actions.lane_context[SharedValues::GRADLE_ALL_MAPPING_TXT_OUTPUT_PATHS]
        ipa_output_path = Actions.lane_context[SharedValues::IPA_OUTPUT_PATH]
        dsym_output_path = Actions.lane_context[SharedValues::DSYM_OUTPUT_PATH]

        artifacts = []
        artifacts << apk_output_paths unless blank?(apk_output_paths)
        artifacts << aab_output_paths unless blank?(aab_output_paths)
        artifacts << mapping_output_paths unless blank?(mapping_output_paths)
        artifacts << ipa_output_path unless blank?(ipa_output_path)
        artifacts << dsym_output_path unless blank?(dsym_output_path)

        # noinspection RubyResolve
        other_action.copy_artifacts(target_path: 'artifacts', artifacts: artifacts)

        Actions.lane_context[SharedValues::COPIED_ARTIFACTS_OUTPUT_PATH] = 'artifacts'
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Copies artifacts from Android and iOS builds into a directory for easy external access'
      end

      def self.details
        'Copies artifacts for Android and iOS builds so that CI services like GitHub actions can easily known where to find these files'
      end

      def self.available_options
        []
      end

      def self.output
        [
          'COPIED_ARTIFACTS_OUTPUT_PATH', 'The path of the directory containing all copied artifacts'
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

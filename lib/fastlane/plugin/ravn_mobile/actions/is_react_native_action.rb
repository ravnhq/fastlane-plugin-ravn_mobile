require 'fastlane'
require_relative '../helper/framework_helper'

module Fastlane
  module Actions
    module SharedValues
      IS_REACT_NATIVE_PROJECT = :IS_REACT_NATIVE_PROJECT
    end

    # Action to detect if project is React Native
    class IsReactNativeAction < Action
      def self.run(_params)
        Action.lane_context[SharedValues::IS_REACT_NATIVE_PROJECT] = Helper::FrameworkHelper.is_react_native?
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Action to detect if the current project is using React Native'
      end

      def self.details
        'The return value of this action is true if a React Native project is detected'
      end

      def self.output
        [
          'IS_REACT_NATIVE_PROJECT', 'Whether or not the project uses React Native'
        ]
      end

      def self.available_options
        []
      end

      def self.return_type
        :bool
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

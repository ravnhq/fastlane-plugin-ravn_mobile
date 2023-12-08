require 'fastlane'
require_relative '../helper/framework_helper'
require_relative '../util/util'

module Fastlane
  module Actions
    class CommitVersionAction < Action
      def self.run(params)
        xcodeproj = params[:xcodeproj]
        message = params[:message]

        if Helper::FrameworkHelper.is_expo?
          # noinspection RubyResolve
          other_action.git_commit(path: ['app.json'], message: message)
        elsif !blank?(xcodeproj)
          # noinspection RubyResolve
          other_action.commit_version_bump(message: message, xcodeproj: xcodeproj)
        else
          project_dir = Helper::FrameworkHelper.is_react_native? || Helper::FrameworkHelper.is_flutter? ? 'android/' : './'
          properties_path = File.join(project_dir, 'gradle.properties')

          # noinspection RubyResolve
          other_action.git_commit(path: [properties_path], message: message)
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Commit version change for iOS and Android projects'
      end

      def self.details
        'Commits changes made to version code, supports Android (via gradle.properties) and iOS'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :message,
                                       env_name: 'FL_COMMIT_VERSION_MESSAGE',
                                       description: 'Commit message',
                                       type: String,
                                       default_value: 'chore: Version bump'),
          FastlaneCore::ConfigItem.new(key: :xcodeproj,
                                       env_name: 'FL_COMMIT_VERSION_XCODEPROJ',
                                       description: 'Xcodeproj if running for iOS',
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

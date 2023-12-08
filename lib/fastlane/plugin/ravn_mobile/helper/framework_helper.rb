require 'json'
require 'psych'

module Fastlane
  module Helper
    class FrameworkHelper
      def self.is_react_native?
        return false unless File.exist?('package.json')
        return false unless Dir.exist?('android') && Dir.exist?('ios')

        package_contents = read_package_json
        package_contents&.dig('dependencies')&.dig('react-native') ? true : false
      end

      def self.is_expo?
        return false unless File.exist?('package.json')

        package_contents = read_package_json
        package_contents&.dig('dependencies')&.dig('expo') ? true : false
      end

      def self.is_flutter?
        return false unless File.exist?('pubspec.yaml')
        return false unless Dir.exist?('lib') && (Dir.exist?('android') || Dir.exist?('ios'))

        pubspec_content = read_pubspec_yaml
        pubspec_content&.dig('dependencies')&.dig('flutter')&.dig('sdk') == 'flutter'
      end

      def self.read_package_json
        JSON.parse(File.read('package.json'))
      rescue StandardError
        {}
      end

      def self.read_pubspec_yaml
        Psych.load_file('pubspec.yaml')
      rescue StandardError
        {}
      end
    end
  end
end

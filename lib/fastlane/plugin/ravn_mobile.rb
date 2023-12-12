require_relative './ravn_mobile/version'

module Fastlane
  module RavnMobile
    # Return all .rb files inside the "actions", "helper" and "fastlane" directory
    def self.all_classes
      Dir[File.expand_path('**/{actions,helper,fastlane}/*.rb', File.dirname(__FILE__))]
    end
  end
end

# By default we want to import all available actions and helpers
# A plugin can contain any number of actions and plugins
Fastlane::RavnMobile.all_classes.each do |current|
  require current
end

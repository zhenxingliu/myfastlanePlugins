require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class GitCommitLzxHelper
      # class methods that you define here become available in your action
      # as `Helper::GitCommitLzxHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the git_commit_lzx plugin helper!")
      end
    end
  end
end

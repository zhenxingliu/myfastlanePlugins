require 'fastlane/action'
require_relative '../helper/git_commit_lzx_helper'

module Fastlane
  module Actions
    class GitCommitLzxAction < Action
      def self.run(params)
        if params[:path].kind_of?(String)
          paths = params[:path].shellescape
        else
          paths = params[:path].map(&:shellescape).join(' ')
        end
        UI.message("The git_commit_lzx plugin is working!")
        if params[:all] == true {
          result = Actions.sh("git commit -a -m #{params[:message].shellescape}")
        }else{
          result = Actions.sh("git commit -m #{params[:message].shellescape} #{paths}")
        }
        UI.success("Successfully committed \"💾.")
        return result
      end

      def self.description
        "git commit all add change to git"
      end

      def self.authors
        ["zhenxingliu"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "git commit all add change to git"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :all,description: "",)
          FastlaneCore::ConfigItem.new(key: :path,
                                       description: "The file you want to commit",
                                       is_string: true),
          FastlaneCore::ConfigItem.new(key: :message,
                                       description: "The commit message that should be used")
        ]
      end

      def self.example_code
        [
          'git_commit(all:true , path: "*" , message: "Version Bump"',
          'git_commit(path: "./version.txt", message: "Version Bump")',
          'git_commit(path: ["./version.txt", "./changelog.txt"], message: "Version Bump")',
          'git_commit(path: ["./*.txt", "./*.md"], message: "Update documentation")'
        ]
      end

      def self.category
        :source_control
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end

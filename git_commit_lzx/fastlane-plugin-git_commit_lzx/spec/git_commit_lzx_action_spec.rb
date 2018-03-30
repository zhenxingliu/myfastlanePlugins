describe Fastlane::Actions::GitCommitLzxAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The git_commit_lzx plugin is working!")

      Fastlane::Actions::GitCommitLzxAction.run(nil)
    end
  end
end

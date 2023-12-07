describe Fastlane::Actions::RavnMobileAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The ravn_mobile plugin is working!")

      Fastlane::Actions::RavnMobileAction.run(nil)
    end
  end
end

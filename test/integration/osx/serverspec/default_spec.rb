require_relative '../../../kitchen/data/spec_helper'

context 'redis formula' do
  describe command('redis-cli -h') do
    its(:stdout) { should match(/^redis-cli/) }
    its(:exit_status) { should eq 1 }
  end
end

context 'caffeine cask' do
  describe command('brew cask info caffeine') do
    its(:stdout) { should match(/Caffeine.app \(app\)/) }
    its(:exit_status) { should eq 0 }
  end

  describe file('/opt/homebrew-cask/Caskroom/caffeine') do
    it { should be_directory }
  end
end

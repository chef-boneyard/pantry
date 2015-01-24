require 'spec_helper'

describe 'pantry::mac_os_x' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['platform_family']  = 'mac_os_x'
      node.set['platform_version'] = '10.10'
    end.converge(described_recipe)
  end

  before do
    # Homebrew Command Stubs
    stub_command('which git').and_return('/usr/local/bin/git')
  end

  it 'includes build-essential recipe' do
    expect(chef_run).to include_recipe('build-essential')
  end

  it 'creates /Library/Caches directory' do
    expect(chef_run).to create_directory('/Library/Caches').with(mode: 01777)
  end

  %w{
    homebrew
    homebrew::cask
    homebrew::install_formulas
    homebrew::install_casks
  }.each do |recipe|
    it "includes #{recipe} recipe" do
      expect(chef_run).to include_recipe(recipe)
    end
  end
end

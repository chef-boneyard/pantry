require 'spec_helper'

describe 'pantry::default' do
  context 'Mac OS X' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'mac_os_x', version: '10.10')
        .converge(described_recipe)
    end

    before do
      # Homebrew Command Stubs
      stub_command('which git').and_return('/usr/local/bin/git')
    end

    it 'includes pantry::mac_os_x recipe' do
      expect(chef_run).to include_recipe('pantry::mac_os_x')
    end
  end

  context 'Windows' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'windows', version: '2012')
        .converge(described_recipe)
    end

    it 'includes pantry::windows recipe' do
      expect(chef_run).to include_recipe('pantry::windows')
    end
  end

  context 'Debian Linux' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'debian', version: '7.7')
        .converge(described_recipe)
    end

    it 'includes pantry::debian recipe' do
      expect(chef_run).to include_recipe('pantry::debian')
    end
  end

  context 'RHEL Linux' do
    let(:chef_run_centos) do
      ChefSpec::ServerRunner.new(platform: 'centos', version: '7.0')
        .converge(described_recipe)
    end

    it 'includes pantry::rhel recipe' do
      expect(chef_run_centos).to include_recipe('pantry::rhel')
    end
  end
end

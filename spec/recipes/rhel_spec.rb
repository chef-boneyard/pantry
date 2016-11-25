#
# Cookbook:: pantry
# Spec:: rhel
#

require 'spec_helper'

describe 'pantry::rhel' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.set['platform_family']  = 'rhel'
      node.set['platform_version'] = '7.0'
    end.converge(described_recipe)
  end

  it 'compiles without error' do
    chef_run
  end
end

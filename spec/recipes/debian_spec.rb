#
# Cookbook:: pantry
# Spec:: debian
#

describe 'pantry::debian' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.set['platform_family']  = 'debian'
      node.set['platform_version'] = '7.7'
    end.converge(described_recipe)
  end

  it 'compiles without error' do
    chef_run
  end
end

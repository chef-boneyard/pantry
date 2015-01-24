require 'spec_helper'

describe 'pantry::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2012').
      converge(described_recipe)
  end

  it 'includes chocolatey recipe' do
    expect(chef_run).to include_recipe('chocolatey')
  end
end

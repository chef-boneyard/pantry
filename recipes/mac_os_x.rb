#
# Cookbook:: pantry
# Attributes:: mac_os_x
#
# Copyright:: 2014-2016, Chef Software, Inc. <legal@chef.io>
#
include_recipe 'build-essential'

directory '/Library/Caches' do
  mode '1777'
end

include_recipe 'homebrew'
include_recipe 'homebrew::cask'
include_recipe 'homebrew::install_taps'
include_recipe 'homebrew::install_formulas'
include_recipe 'homebrew::install_casks'

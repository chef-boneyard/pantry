#
# Cookbook Name:: pantry
# Attributes:: mac_os_x
#
# Copyright (C) 2014, Chef Software, Inc. <legal@getchef.com>
#
include_recipe 'build-essential'

directory '/Library/Caches' do
  mode 01777
end

include_recipe 'homebrew'
include_recipe 'homebrew::cask'
include_recipe 'homebrew::install_formulas'
include_recipe 'homebrew::install_casks'

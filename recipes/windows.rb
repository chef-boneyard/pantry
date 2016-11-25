#
# Cookbook:: pantry
#
# Copyright:: 2014-2016, Chef Software, Inc. <legal@chef.io>
#
include_recipe 'chocolatey'

node['chocolatey']['packages'].each do |p|
  chocolatey p
end

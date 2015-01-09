#
# Cookbook Name:: pantry
#
# Copyright (C) 2014, Chef Software, Inc. <legal@getchef.com>
#
include_recipe 'chocolatey'

node['chocolatey']['packages'].each do |p|
  chocolatey p
end

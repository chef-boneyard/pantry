#
# Cookbook:: pantry
# Attributes:: default
#

include_recipe "pantry::#{node['platform_family']}"
include_recipe 'pantry::repositories'

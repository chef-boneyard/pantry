#
# Cookbook Name:: pantry
# Attributes:: default
#

include_recipe "pantry::#{node['platform_family']}"

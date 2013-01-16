#
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright (C) 2013 sdomino
# 
# All rights reserved - Do Not Redistribute
#

supported_platforms = [ 'ubuntu', 'centos' ]
if not supported_platforms.include? node[:platform]
  Chef::Log.info("#{node[:platform]} is not yet supported.")
  exit(1)
end

include_recipe "mongodb::#{node[:platform]}"
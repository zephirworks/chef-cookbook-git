#
# Cookbook Name:: git
# Recipe:: users
#
# Copyright 2011, ZephirWorks.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

directory "#{node[:git][:home_dir]}/.ssh" do
  owner node[:git][:user]
  group node[:git][:group]
  mode 0700
end

keys = []
search(:users, "groups:#{node[:git][:devel_group]}") do |u|
  keys << u[:ssh_keys]
end

template "#{node[:git][:home_dir]}/.ssh/authorized_keys" do
  source "authorized_keys.erb"
  owner node[:git][:user]
  group node[:git][:group]
  mode "0600"
  variables :ssh_keys => keys
end

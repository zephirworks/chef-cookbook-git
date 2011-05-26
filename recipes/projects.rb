#
# Cookbook Name:: git
# Recipe:: projects
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

search(:projects) do |p|
  dir = "#{node[:git][:home_dir]}/#{p[:id]}.git"

  unless ::File.exists?(dir)
    directory dir do
      owner node[:git][:user]
      group node[:git][:group]
      mode 0700
    end

    execute "git init" do
      command "git init --bare"
      cwd dir
      user node[:git][:user]
    end
  end

  file "#{dir}/description" do
    content p[:name] || p[:id]
    owner node[:git][:user]
    group node[:git][:group]
    mode 0644
  end
end

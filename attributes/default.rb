#
# Cookbook Name:: git
# Attributes:: default
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

default['git']['server_style'] = 'daemon'
default['git']['user'] = 'git'
default['git']['home_dir'] = '/home/git'

default['git']['shell'] = case node[:platform]
when "freebsd"
  "/usr/local/libexec/git-core/git-shell"
else
  "/usr/bin/git-shell"
end

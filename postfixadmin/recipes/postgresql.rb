# encoding: UTF-8
#
# Cookbook Name:: postfixadmin
# Recipe:: postgresql
# Author:: Xabier de Zuazo (<xabier@onddo.com>)
# Copyright:: Copyright (c) 2014 Onddo Labs, SL. (www.onddo.com)
# License:: Apache License, Version 2.0
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

# Warning: saves the PostgreSQL password unencrypted
if Chef::Config[:solo] && node['postgresql']['password']['postgres'].nil?
  fail 'You must set node["postgresql"]["password"]["postgres"] in '\
    'chef-solo mode.'
elsif !Chef::Config[:solo]
  node.set_unless['postgresql']['password']['postgres'] = secure_password
  node.save
end

include_recipe 'postgresql::server'

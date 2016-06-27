#
# Cookbook Name:: virtualbox
# Attributes:: default
#
# Copyright 2011, Joshua Timberman
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

default['virtualbox']['url'] = case node['platform_family']
                               when 'mac_os_x'
                                 'http://download.virtualbox.org/virtualbox/4.2.12/VirtualBox-4.2.12-84980-OSX.dmg'
                               when 'windows'
                                 'http://download.virtualbox.org/virtualbox/4.2.12/VirtualBox-4.2.12-84980-Win.exe'
                               end

default['virtualbox']['version'] = case node['platform_family']
                                   when 'windows'
                                     Vbox::Helpers.vbox_version(node['virtualbox']['url'])
                                   when 'debian', 'rhel', 'fedora'
                                     '4.3'
                                   end

default['virtualbox']['package_gpgkey_url'] = value_for_platform(
  debian: {
    '>= 8' => 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc',
  },
  default: 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc'
)

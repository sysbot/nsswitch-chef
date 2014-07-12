# Providers:: source
#
# Copyright 2014, Bao Nguyen
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

require 'set'

action :add do
  sources = node[:nsswitch][new_resource.name].to_set
  sources << new_resource.param unless new_resource.param == nil
  node.set[:nsswitch][new_resource.name] = sources.to_a
  t = template "/etc/nsswitch.conf" do
		source "nsswitch.conf.erb"
		mode 00644
	  owner "root"
	  group "root"
	end
  new_resource.updated_by_last_action(t.updated_by_last_action?)
end

action :remove do
  sources = node[:nsswitch][new_resource.name].to_set
  node.set[:nsswitch][new_resource.name] = sources.delete(new_resource.name).to_a
  new_resource.updated_by_last_action(true)
end

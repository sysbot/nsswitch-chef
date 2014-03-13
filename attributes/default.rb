# Attributes:: default
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

# for more information on passing the parameter use [1]
node.default[:nsswitch] = {
  :passwd => ["files"],
  :group => ["files"],
  :shadow => ["files"],
  :hosts => ["files", "dns"],
  :networks => ["files"],
  :protocols => ["db","files"],
  :services => ["db","files"],
  :ethers => ["db","files"],
  :rpc => ["db","files"],
  :netgroup => ["nis"]
}

# [1] http://man7.org/linux/man-pages/man5/nsswitch.conf.5.html
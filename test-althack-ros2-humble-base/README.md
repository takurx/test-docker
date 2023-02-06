# Log

- Fail, can not publish/subscriber example

```
hiya@ujimatsu:~$ sudo docker run -it -p 1880:1880 --network=host --name mynodered-4 nodered/node-red:2.2.2-12
[sudo] password for chiya: 
docker: Error response from daemon: Conflict. The container name "/mynodered-4" is already in use by container "520a7521868a3e3002ebec7475b68ca7f4455e354d190fc493a0f0c0eb8dd5f2". You have to remove (or rename) that container to be able to reuse that name.
See 'docker run --help'.
chiya@ujimatsu:~$ sudo docker run -it -p 1880:1880 --network=host --name mynodered-5 nodered/node-red:2.2.2-12
WARNING: Published ports are discarded when using host network mode

> node-red-docker@2.2.2 start /usr/src/node-red
> node $NODE_OPTIONS node_modules/node-red/red.js $FLOWS "--userDir" "/data"

6 Feb 16:01:40 - [info] 

Welcome to Node-RED
===================

6 Feb 16:01:40 - [info] Node-RED version: v2.2.2
6 Feb 16:01:40 - [info] Node.js  version: v12.22.8
6 Feb 16:01:40 - [info] Linux 5.15.0-58-generic x64 LE
6 Feb 16:01:40 - [info] Loading palette nodes
6 Feb 16:01:40 - [info] Settings file  : /data/settings.js
6 Feb 16:01:40 - [info] Context store  : 'default' [module=memory]
6 Feb 16:01:40 - [info] User directory : /data
6 Feb 16:01:40 - [warn] Projects disabled : editorTheme.projects.enabled=false
6 Feb 16:01:40 - [info] Flows file     : /data/flows.json
6 Feb 16:01:40 - [warn] 

---------------------------------------------------------------------
Your flow credentials file is encrypted using a system-generated key.

If the system-generated key is lost for any reason, your credentials
file will not be recoverable, you will have to delete it and re-enter
your credentials.

You should set your own key using the 'credentialSecret' option in
your settings file. Node-RED will then re-encrypt your credentials
file using your chosen key the next time you deploy a change.
---------------------------------------------------------------------

6 Feb 16:01:40 - [info] Server now running at http://127.0.0.1:1880/
6 Feb 16:01:40 - [info] Starting flows
6 Feb 16:01:40 - [info] Started flows
6 Feb 16:02:36 - [info] Installing module: node-red-contrib-ros2, version: 0.0.1
6 Feb 16:02:50 - [warn] Installation of module node-red-contrib-ros2 failed:
6 Feb 16:02:50 - [warn] ------------------------------------------
6 Feb 16:02:50 - [warn] Unable to detect ROS, please make sure a supported version of ROS is sourced
gyp: Call to 'node scripts/ros_distro.js' returned exit status 1 while in binding.gyp. while trying to load binding.gyp
gyp ERR! configure error 
gyp ERR! stack Error: `gyp` failed with exit code: 1
gyp ERR! stack     at ChildProcess.onCpExit (/usr/local/lib/node_modules/npm/node_modules/node-gyp/lib/configure.js:351:16)
gyp ERR! stack     at ChildProcess.emit (events.js:314:20)
gyp ERR! stack     at Process.ChildProcess._handle.onexit (internal/child_process.js:276:12)
gyp ERR! System Linux 5.15.0-58-generic
gyp ERR! command "/usr/local/bin/node" "/usr/local/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js" "rebuild"
gyp ERR! cwd /data/node_modules/rclnodejs
gyp ERR! node -v v12.22.8
gyp ERR! node-gyp -v v5.1.0
gyp ERR! not ok 
npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! rclnodejs@0.17.0 install: `node-gyp rebuild`
npm ERR! Exit status 1
npm ERR! 
npm ERR! Failed at the rclnodejs@0.17.0 install script.
npm ERR! This is probably not a problem with npm. There is likely additional logging output above.

npm ERR! A complete log of this run can be found in:
npm ERR!     /data/.npm/_logs/2023-02-06T16_02_50_075Z-debug.log

6 Feb 16:02:50 - [warn] ------------------------------------------
Error: Install failed
    at /usr/src/node-red/node_modules/@node-red/registry/lib/installer.js:285:25
    at processTicksAndRejections (internal/process/task_queues.js:97:5)
6 Feb 16:02:50 - [error] Error: Install failed
^C6 Feb 16:09:11 - [info] Stopping flows
6 Feb 16:09:11 - [info] Stopped flows
chiya@ujimatsu:~$ docker pull althack/ros2:humble-base
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/images/create?fromImage=althack%2Fros2&tag=humble-base": dial unix /var/run/docker.sock: connect: permission denied
chiya@ujimatsu:~$ sudo docker pull althack/ros2:humble-base
Error response from daemon: Head "https://registry-1.docker.io/v2/althack/ros2/manifests/humble-base": Get "https://auth.docker.io/token?scope=repository%3Aalthack%2Fros2%3Apull&service=registry.docker.io": net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)
chiya@ujimatsu:~$ sudo docker pull althack/ros2:humble-base
humble-base: Pulling from althack/ros2
677076032cca: Already exists 
d5f3a0f4290f: Pull complete 
8b863a3ce8f4: Pull complete 
1ed8945cecee: Pull complete 
Digest: sha256:057789fd3530780b9303f67ffc4692b4e46fe3ca3ce434d6d8b64b59c8235705
Status: Downloaded newer image for althack/ros2:humble-base
docker.io/althack/ros2:humble-base
chiya@ujimatsu:~$ sudo docker run -it --network=host althack/ros2:humble-base
root@ujimatsu:/# source /opt/ros/humble/setup.bash
root@ujimatsu:/# ls
bin   dev  home  lib32  libx32  mnt  proc  run   srv  tmp  var
boot  etc  lib   lib64  media   opt  root  sbin  sys  usr
root@ujimatsu:/# ros2 run demo_nodes_cpp talker
Package 'demo_nodes_cpp' not found
root@ujimatsu:/# cat /opt/ros/humble/setup.bash
# copied from ament_package/template/prefix_level/setup.bash

AMENT_SHELL=bash

# source setup.sh from same directory as this file
AMENT_CURRENT_PREFIX=$(builtin cd "`dirname "${BASH_SOURCE[0]}"`" && pwd)
# trace output
if [ -n "$AMENT_TRACE_SETUP_FILES" ]; then
  echo "# . \"$AMENT_CURRENT_PREFIX/setup.sh\""
fi
. "$AMENT_CURRENT_PREFIX/setup.sh"
root@ujimatsu:/# wget https://raw.githubusercontent.com/ros2/examples/foxy/rclpy/topics/minimal_publisher/examples_rclpy_minimal_publisher/publisher_member_function.py
bash: wget: command not found
root@ujimatsu:/# apt install wget
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
E: Unable to locate package wget
root@ujimatsu:/# sudo apt install wget
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
E: Unable to locate package wget
root@ujimatsu:/# curl
curl: try 'curl --help' or 'curl --manual' for more information
root@ujimatsu:/# ros2 pkg create --build-type ament_python py_pubsub
going to create a new package
package name: py_pubsub
destination directory: /
package format: 3
version: 0.0.0
description: TODO: Package description
maintainer: ['root <root@todo.todo>']
licenses: ['TODO: License declaration']
build type: ament_python
dependencies: []
creating folder ./py_pubsub
creating ./py_pubsub/package.xml
creating source folder
creating folder ./py_pubsub/py_pubsub
creating ./py_pubsub/setup.py
creating ./py_pubsub/setup.cfg
creating folder ./py_pubsub/resource
creating ./py_pubsub/resource/py_pubsub
creating ./py_pubsub/py_pubsub/__init__.py
creating folder ./py_pubsub/test
creating ./py_pubsub/test/test_copyright.py
creating ./py_pubsub/test/test_flake8.py
creating ./py_pubsub/test/test_pep257.py

[WARNING]: Unknown license 'TODO: License declaration'.  This has been set in the package.xml, but no LICENSE file has been created.
It is recommended to use one of the ament license identitifers:
Apache-2.0
BSL-1.0
BSD-2.0
BSD-2-Clause
BSD-3-Clause
GPL-3.0-only
LGPL-3.0-only
MIT
MIT-0
root@ujimatsu:/# ls
bin   dev  home  lib32  libx32  mnt  proc       root  sbin  sys  usr
boot  etc  lib   lib64  media   opt  py_pubsub  run   srv   tmp  var
root@ujimatsu:/# curl https://raw.githubusercontent.com/ros2/examples/humble/rclpy/topics/minimal_publisher/examples_rclpy_minimal_publisher/publisher_member_function.py
# Copyright 2016 Open Source Robotics Foundation, Inc.
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

import rclpy
from rclpy.node import Node

from std_msgs.msg import String


class MinimalPublisher(Node):

    def __init__(self):
        super().__init__('minimal_publisher')
        self.publisher_ = self.create_publisher(String, 'topic', 10)
        timer_period = 0.5  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        self.i = 0

    def timer_callback(self):
        msg = String()
        msg.data = 'Hello World: %d' % self.i
        self.publisher_.publish(msg)
        self.get_logger().info('Publishing: "%s"' % msg.data)
        self.i += 1


def main(args=None):
    rclpy.init(args=args)

    minimal_publisher = MinimalPublisher()

    rclpy.spin(minimal_publisher)

    # Destroy the node explicitly
    # (optional - otherwise it will be done automatically
    # when the garbage collector destroys the node object)
    minimal_publisher.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
root@ujimatsu:/# source /opt/ros/dashing/setup.bash
bash: /opt/ros/dashing/setup.bash: No such file or directory
root@ujimatsu:/# source /opt/ros/humble/setup.bash
root@ujimatsu:/# ros2 run demo_nodes_cpp talker
Package 'demo_nodes_cpp' not found
root@ujimatsu:/# ls
bin   dev  home  lib32  libx32  mnt  proc       root  sbin  sys  usr
boot  etc  lib   lib64  media   opt  py_pubsub  run   srv   tmp  var
root@ujimatsu:/# ros2 pkg create --build-type ament_cmake cpp_pubsub
going to create a new package
package name: cpp_pubsub
destination directory: /
package format: 3
version: 0.0.0
description: TODO: Package description
maintainer: ['root <root@todo.todo>']
licenses: ['TODO: License declaration']
build type: ament_cmake
dependencies: []
creating folder ./cpp_pubsub
creating ./cpp_pubsub/package.xml
creating source and include folder
creating folder ./cpp_pubsub/src
creating folder ./cpp_pubsub/include/cpp_pubsub
creating ./cpp_pubsub/CMakeLists.txt

[WARNING]: Unknown license 'TODO: License declaration'.  This has been set in the package.xml, but no LICENSE file has been created.
It is recommended to use one of the ament license identitifers:
Apache-2.0
BSL-1.0
BSD-2.0
BSD-2-Clause
BSD-3-Clause
GPL-3.0-only
LGPL-3.0-only
MIT
MIT-0
root@ujimatsu:/# cd cpp_pubsub/
root@ujimatsu:/cpp_pubsub# ls
CMakeLists.txt  include  package.xml  src
root@ujimatsu:/cpp_pubsub# apt
apt 2.4.8 (amd64)
Usage: apt [options] command

apt is a commandline package manager and provides commands for
searching and managing as well as querying information about packages.
It provides the same functionality as the specialized APT tools,
like apt-get and apt-cache, but enables options more suitable for
interactive use by default.

Most used commands:
  list - list packages based on package names
  search - search in package descriptions
  show - show package details
  install - install packages
  reinstall - reinstall packages
  remove - remove packages
  autoremove - Remove automatically all unused packages
  update - update list of available packages
  upgrade - upgrade the system by installing/upgrading packages
  full-upgrade - upgrade the system by removing/installing/upgrading packages
  edit-sources - edit the source information file
  satisfy - satisfy dependency strings

See apt(8) for more information about the available commands.
Configuration options and syntax is detailed in apt.conf(5).
Information about how to configure sources can be found in sources.list(5).
Package and version choices can be expressed via apt_preferences(5).
Security details are available in apt-secure(8).
                                        This APT has Super Cow Powers.
root@ujimatsu:/cpp_pubsub# apt install wget
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
E: Unable to locate package wget
root@ujimatsu:/cpp_pubsub# apt-get install wget
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
E: Unable to locate package wget
root@ujimatsu:/cpp_pubsub# apt update
Get:1 http://packages.ros.org/ros2/ubuntu jammy InRelease [4,673 B]            
Get:2 http://packages.ros.org/ros2/ubuntu jammy/main amd64 Packages [791 kB]   
Get:3 http://archive.ubuntu.com/ubuntu jammy InRelease [270 kB]                
Get:4 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [114 kB]        
Get:5 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [107 kB]      
Get:6 http://archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [17.5 MB] 
Get:7 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]      
Get:8 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [681 kB]
Get:9 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [5,557 B]
Get:10 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [799 kB]
Get:11 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [754 kB]
Get:12 http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages [1,792 kB]   
Get:13 http://archive.ubuntu.com/ubuntu jammy/restricted amd64 Packages [164 kB]
Get:14 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [266 kB]
Get:15 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [8,978 B]
Get:16 http://archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [734 kB]
Get:17 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1,008 kB]
Get:18 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [1,083 kB]                         
95% [18 Packages 21.0 kB/1,083 kB 2%]                                                               403 kB/s Get:19 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [49.0 kB]                       
Get:20 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [22.4 kB]                   
Fetched 26.2 MB in 1min 10s (377 kB/s)                                                                      
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
4 packages can be upgraded. Run 'apt list --upgradable' to see them.
root@ujimatsu:/cpp_pubsub# apt install wget
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following NEW packages will be installed:
  wget
0 upgraded, 1 newly installed, 0 to remove and 4 not upgraded.
Need to get 367 kB of archives.
After this operation, 1,008 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu jammy/main amd64 wget amd64 1.21.2-2ubuntu1 [367 kB]
Fetched 367 kB in 20s (18.6 kB/s)                                                                           
debconf: delaying package configuration, since apt-utils is not installed
Selecting previously unselected package wget.
(Reading database ... 34672 files and directories currently installed.)
Preparing to unpack .../wget_1.21.2-2ubuntu1_amd64.deb ...
Unpacking wget (1.21.2-2ubuntu1) ...
Setting up wget (1.21.2-2ubuntu1) ...
root@ujimatsu:/cpp_pubsub# wget -O publisher_member_function.cpp https://raw.githubusercontent.com/ros2/examples/humble/rclcpp/topics/minimal_publisher/member_function.cpp
--2023-02-06 16:24:43--  https://raw.githubusercontent.com/ros2/examples/humble/rclcpp/topics/minimal_publisher/member_function.cpp
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.108.133, 185.199.109.133, 185.199.110.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.108.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1776 (1.7K) [text/plain]
Saving to: ‘publisher_member_function.cpp’

publisher_member_function.c 100%[========================================>]   1.73K  --.-KB/s    in 0s      

2023-02-06 16:24:43 (6.02 MB/s) - ‘publisher_member_function.cpp’ saved [1776/1776]

root@ujimatsu:/cpp_pubsub# ls
CMakeLists.txt  include  package.xml  publisher_member_function.cpp  src
root@ujimatsu:/cpp_pubsub# cat package.xml 
<?xml version="1.0"?>
<?xml-model href="http://download.ros.org/schema/package_format3.xsd" schematypens="http://www.w3.org/2001/XMLSchema"?>
<package format="3">
  <name>cpp_pubsub</name>
  <version>0.0.0</version>
  <description>TODO: Package description</description>
  <maintainer email="root@todo.todo">root</maintainer>
  <license>TODO: License declaration</license>

  <buildtool_depend>ament_cmake</buildtool_depend>

  <test_depend>ament_lint_auto</test_depend>
  <test_depend>ament_lint_common</test_depend>

  <export>
    <build_type>ament_cmake</build_type>
  </export>
</package>
root@ujimatsu:/cpp_pubsub# cat CMakeLists.txt 
cmake_minimum_required(VERSION 3.8)
project(cpp_pubsub)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
# uncomment the following section in order to fill in
# further dependencies manually.
# find_package(<dependency> REQUIRED)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # comment the line when a copyright and license is added to all source files
  set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # comment the line when this package is in a git repo and when
  # a copyright and license is added to all source files
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
root@ujimatsu:/cpp_pubsub# ls
CMakeLists.txt  include  package.xml  publisher_member_function.cpp  src
root@ujimatsu:/cpp_pubsub# mkdir rclcpp
root@ujimatsu:/cpp_pubsub# nano rclcpp/rclcpp.hpp
bash: nano: command not found
root@ujimatsu:/cpp_pubsub# vi rclcpp/rclcpp.hpp
bash: vi: command not found
root@ujimatsu:/cpp_pubsub# ls
CMakeLists.txt  include  package.xml  publisher_member_function.cpp  rclcpp  src
root@ujimatsu:/cpp_pubsub# 
```

```
chiya@ujimatsu:~$ sudo docker run -it --network=host althack/ros2:humble-base
[sudo] password for chiya: 
root@ujimatsu:/# source /opt/ros/humble/setup.bash
root@ujimatsu:/# apt update
Get:1 http://packages.ros.org/ros2/ubuntu jammy InRelease [4,673 B]
Get:2 http://packages.ros.org/ros2/ubuntu jammy/main amd64 Packages [791 kB]   
Get:3 http://archive.ubuntu.com/ubuntu jammy InRelease [270 kB]                
Get:4 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]                                       
Get:5 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [114 kB]                                         
Get:6 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [107 kB]                                       
Get:7 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [799 kB]                         
Get:8 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [266 kB]                                 
Get:9 http://archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [17.5 MB]                                  
Get:10 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [681 kB]                      
Get:11 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [754 kB]                            
Get:12 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [5,557 B]                     
50% [9 Packages 7,363 kB/17.5 MB 42%]                                                          186 kB/s 1min 20s^Get:13 http://archive.ubuntu.com/ubuntu jammy/restricted amd64 Packages [164 kB]                                
Get:14 http://archive.ubuntu.com/ubuntu jammy/main amd64 Packages [1,792 kB]                                    
Get:15 http://archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [734 kB]                        
Get:16 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1,008 kB]                        
Get:17 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [8,978 B]                       
Get:18 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [1,083 kB]                            
Get:19 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [49.0 kB]                           
Get:20 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [22.4 kB]                       
Fetched 26.2 MB in 2min 39s (165 kB/s)                                                                          
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
4 packages can be upgraded. Run 'apt list --upgradable' to see them.
root@ujimatsu:/# source /opt/ros/humble/setup.bash
```
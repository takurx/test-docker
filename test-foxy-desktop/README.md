# Log

- ROS複数Docker通信 - Qiita
    - https://qiita.com/tomoyafujita/items/07937a25bc48aa076056

terminal 1
```
chiya@ujimatsu:~$ docker pull osrf/ros:foxy-desktop
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/images/create?fromImage=osrf%2Fros&tag=foxy-desktop": dial unix /var/run/docker.sock: connect: permission denied
chiya@ujimatsu:~$ sudo docker pull osrf/ros:foxy-desktop
[sudo] password for chiya: 
Error response from daemon: Head "https://registry-1.docker.io/v2/osrf/ros/manifests/foxy-desktop": Get "https://auth.docker.io/token?scope=repository%3Aosrf%2Fros%3Apull&service=registry.docker.io": net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)
chiya@ujimatsu:~$ sudo docker pull osrf/ros:foxy-desktop
Error response from daemon: Head "https://registry-1.docker.io/v2/osrf/ros/manifests/foxy-desktop": Get "https://auth.docker.io/token?scope=repository%3Aosrf%2Fros%3Apull&service=registry.docker.io": net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)
chiya@ujimatsu:~$ sudo docker pull osrf/ros:foxy-desktop
foxy-desktop: Pulling from osrf/ros
7608715873ec: Pull complete 
db143da9f5a0: Pull complete 
0f52bb4834a5: Pull complete 
6f105b35b0df: Pull complete 
e1da6af1c970: Pull complete 
4390ba395fc8: Pull complete 
1c508771ef6b: Pull complete 
04699b3e750a: Pull complete 
c60655459143: Pull complete 
06ea369debb9: Pull complete 
60c16f94d4b4: Pull complete 
0c53c00bd4b9: Pull complete 
Digest: sha256:e368a3a78a784e5ffbf4854ded817b5cd8ce97b0302a26190606ba0918a8330e
Status: Downloaded newer image for osrf/ros:foxy-desktop
docker.io/osrf/ros:foxy-desktop
chiya@ujimatsu:~$ docker run -it osrf/ros:foxy-desktop
docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/create": dial unix /var/run/docker.sock: connect: permission denied.
See 'docker run --help'.
chiya@ujimatsu:~$ sudo docker run -it osrf/ros:foxy-desktop
root@f71e146d486f:/# ros2 run demo_nodes_cpp listener &
[1] 31
root@f71e146d486f:/# ros2 run demo_nodes_cpp talker
[INFO] [1675702029.702699969] [talker]: Publishing: 'Hello World: 1'
[INFO] [1675702029.704198683] [listener]: I heard: [Hello World: 1]
[INFO] [1675702030.702427094] [talker]: Publishing: 'Hello World: 2'
[INFO] [1675702030.702721266] [listener]: I heard: [Hello World: 2]
[INFO] [1675702031.702606427] [talker]: Publishing: 'Hello World: 3'
[INFO] [1675702031.703294959] [listener]: I heard: [Hello World: 3]
^C[INFO] [1675702032.433407705] [rclcpp]: signal_handler(signal_value=2)
root@f71e146d486f:/# exit
exit
chiya@ujimatsu:~$ sudo docker run -it --network=host osrf/ros:foxy-desktop
root@ujimatsu:/# ros2 run demo_nodes_cpp listener
^C[INFO] [1675702121.330391428] [rclcpp]: signal_handler(signal_value=2)
root@ujimatsu:/# topic publish start
bash: topic: command not found
root@ujimatsu:/# exit
exit
chiya@ujimatsu:~$ sudo docker osrf/ros:foxy-desktop start
docker: 'osrf/ros:foxy-desktop' is not a docker command.
See 'docker --help'
chiya@ujimatsu:~$ sudo docker run -it osrf/ros:foxy-desktop
root@a3a96fe0c1f8:/# ls
bin   etc   lib32   log    opt   ros_entrypoint.sh  srv  usr
boot  home  lib64   media  proc  run                sys  var
dev   lib   libx32  mnt    root  sbin               tmp
root@a3a96fe0c1f8:/# ros2 run demo_nodes_cpp listener
[INFO] [1675702389.783763874] [listener]: I heard: [Hello World: 1]
[INFO] [1675702390.783642977] [listener]: I heard: [Hello World: 2]
[INFO] [1675702391.783769273] [listener]: I heard: [Hello World: 3]
[INFO] [1675702392.783012319] [listener]: I heard: [Hello World: 4]
[INFO] [1675702393.783031535] [listener]: I heard: [Hello World: 5]
^C[INFO] [1675702511.615726833] [rclcpp]: signal_handler(signal_value=2)
root@a3a96fe0c1f8:/# 
```

terminal 2
```
chiya@ujimatsu:~$ sudo docker run -it osrf/ros:foxy-desktop
[sudo] password for chiya: 
root@d8c436dabd4f:/# exit
exit
chiya@ujimatsu:~$ sudo docker run -it --network=host osrf/ros:foxy-desktop
root@ujimatsu:/# ros2 run demo_nodes_cpp talker
[INFO] [1675702098.860485431] [talker]: Publishing: 'Hello World: 1'
[INFO] [1675702099.860288782] [talker]: Publishing: 'Hello World: 2'
[INFO] [1675702100.860231253] [talker]: Publishing: 'Hello World: 3'
[INFO] [1675702101.860296730] [talker]: Publishing: 'Hello World: 4'
[INFO] [1675702102.860298755] [talker]: Publishing: 'Hello World: 5'
[INFO] [1675702103.860427763] [talker]: Publishing: 'Hello World: 6'
[INFO] [1675702104.860457888] [talker]: Publishing: 'Hello World: 7'
[INFO] [1675702105.860435990] [talker]: Publishing: 'Hello World: 8'
[INFO] [1675702106.860467565] [talker]: Publishing: 'Hello World: 9'
[INFO] [1675702107.860474307] [talker]: Publishing: 'Hello World: 10'
[INFO] [1675702108.860497667] [talker]: Publishing: 'Hello World: 11'
[INFO] [1675702109.860445160] [talker]: Publishing: 'Hello World: 12'
[INFO] [1675702110.860532679] [talker]: Publishing: 'Hello World: 13'
[INFO] [1675702111.860564969] [talker]: Publishing: 'Hello World: 14'
[INFO] [1675702112.860542508] [talker]: Publishing: 'Hello World: 15'
[INFO] [1675702113.860640445] [talker]: Publishing: 'Hello World: 16'
[INFO] [1675702114.860678703] [talker]: Publishing: 'Hello World: 17'
[INFO] [1675702115.860706823] [talker]: Publishing: 'Hello World: 18'
[INFO] [1675702116.860667571] [talker]: Publishing: 'Hello World: 19'
[INFO] [1675702117.860683184] [talker]: Publishing: 'Hello World: 20'
[INFO] [1675702118.860706384] [talker]: Publishing: 'Hello World: 21'
^C[INFO] [1675702119.274989535] [rclcpp]: signal_handler(signal_value=2)
root@ujimatsu:/# exit
exit
chiya@ujimatsu:~$ sudo docker run -it osrf/ros:foxy-desktop
root@15c8618c3838:/# ros2 run demo_nodes_cpp talker
[INFO] [1675702389.782733500] [talker]: Publishing: 'Hello World: 1'
[INFO] [1675702390.782792728] [talker]: Publishing: 'Hello World: 2'
[INFO] [1675702391.782894898] [talker]: Publishing: 'Hello World: 3'
[INFO] [1675702392.782717768] [talker]: Publishing: 'Hello World: 4'
[INFO] [1675702393.782730745] [talker]: Publishing: 'Hello World: 5'
^C[INFO] [1675702393.976559967] [rclcpp]: signal_handler(signal_value=2)
root@15c8618c3838:/# 
```

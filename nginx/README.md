# Log

- DockerでNginxの最小構成
    - https://zenn.dev/ttani/articles/docker-nginx-minimal
- Dockerfileとdocker buildコマンドでDockerイメージの作成：いまさら聞けないDocker入門（3）（1/2 ページ） - ＠IT
    - https://atmarkit.itmedia.co.jp/ait/articles/1407/08/news031.html

```
sudo docker run -v $(pwd):/usr/share/nginx/html -p 80:80 takurx/nginx:1.2
```

```
chiya@ujimatsu:~/JetsonWorks3/test-docker/nginx$ sudo docker build -t takurx/nginx:1.0 .
Sending build context to Docker daemon  4.096kB
Step 1/2 : FROM 'nginx:latest'
 ---> a99a39d070bf
Step 2/2 : RUN service nginx start
 ---> Using cache
 ---> e1d1e75925a1
Successfully built e1d1e75925a1
Successfully tagged takurx/nginx:1.0
chiya@ujimatsu:~/JetsonWorks3/test-docker/nginx$ sudo docker build -t takurx/nginx:1.1 .
Sending build context to Docker daemon  4.096kB
Step 1/2 : FROM 'nginx:latest'
 ---> a99a39d070bf
Step 2/2 : RUN service nginx start
 ---> Using cache
 ---> e1d1e75925a1
Successfully built e1d1e75925a1
Successfully tagged takurx/nginx:1.1
chiya@ujimatsu:~/JetsonWorks3/test-docker/nginx$ docker run takurx/nginx:1.1
docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/create": dial unix /var/run/docker.sock: connect: permission denied.
See 'docker run --help'.
chiya@ujimatsu:~/JetsonWorks3/test-docker/nginx$ sudo docker run takurx/nginx:1.1
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/02/03 16:06:14 [notice] 1#1: using the "epoll" event method
2023/02/03 16:06:14 [notice] 1#1: nginx/1.23.3
2023/02/03 16:06:14 [notice] 1#1: built by gcc 10.2.1 20210110 (Debian 10.2.1-6) 
2023/02/03 16:06:14 [notice] 1#1: OS: Linux 5.15.0-58-generic
2023/02/03 16:06:14 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/02/03 16:06:14 [notice] 1#1: start worker processes
2023/02/03 16:06:14 [notice] 1#1: start worker process 30
2023/02/03 16:06:14 [notice] 1#1: start worker process 31
2023/02/03 16:06:14 [notice] 1#1: start worker process 32
2023/02/03 16:06:14 [notice] 1#1: start worker process 33
2023/02/03 16:06:14 [notice] 1#1: start worker process 34
2023/02/03 16:06:14 [notice] 1#1: start worker process 35
2023/02/03 16:06:14 [notice] 1#1: start worker process 36
2023/02/03 16:06:14 [notice] 1#1: start worker process 37
^C2023/02/03 16:07:03 [notice] 1#1: signal 2 (SIGINT) received, exiting
2023/02/03 16:07:03 [notice] 32#32: exiting
2023/02/03 16:07:03 [notice] 33#33: exiting
2023/02/03 16:07:03 [notice] 35#35: exiting
2023/02/03 16:07:03 [notice] 36#36: exiting
2023/02/03 16:07:03 [notice] 30#30: exiting
2023/02/03 16:07:03 [notice] 31#31: exiting
2023/02/03 16:07:03 [notice] 32#32: exit
2023/02/03 16:07:03 [notice] 33#33: exit
2023/02/03 16:07:03 [notice] 36#36: exit
2023/02/03 16:07:03 [notice] 35#35: exit
2023/02/03 16:07:03 [notice] 30#30: exit
2023/02/03 16:07:03 [notice] 31#31: exit
2023/02/03 16:07:03 [notice] 34#34: exiting
2023/02/03 16:07:03 [notice] 37#37: exiting
2023/02/03 16:07:03 [notice] 34#34: exit
2023/02/03 16:07:03 [notice] 37#37: exit
2023/02/03 16:07:03 [notice] 1#1: signal 14 (SIGALRM) received
2023/02/03 16:07:03 [notice] 1#1: signal 17 (SIGCHLD) received from 30
2023/02/03 16:07:03 [notice] 1#1: worker process 30 exited with code 0
2023/02/03 16:07:03 [notice] 1#1: worker process 31 exited with code 0
2023/02/03 16:07:03 [notice] 1#1: worker process 32 exited with code 0
2023/02/03 16:07:03 [notice] 1#1: worker process 37 exited with code 0
2023/02/03 16:07:03 [notice] 1#1: signal 29 (SIGIO) received
2023/02/03 16:07:03 [notice] 1#1: signal 17 (SIGCHLD) received from 37
2023/02/03 16:07:03 [notice] 1#1: signal 17 (SIGCHLD) received from 34
2023/02/03 16:07:03 [notice] 1#1: worker process 34 exited with code 0
2023/02/03 16:07:03 [notice] 1#1: signal 29 (SIGIO) received
2023/02/03 16:07:03 [notice] 1#1: signal 17 (SIGCHLD) received from 36
2023/02/03 16:07:03 [notice] 1#1: worker process 33 exited with code 0
2023/02/03 16:07:03 [notice] 1#1: worker process 35 exited with code 0
2023/02/03 16:07:03 [notice] 1#1: worker process 36 exited with code 0
2023/02/03 16:07:03 [notice] 1#1: exit
chiya@ujimatsu:~/JetsonWorks3/test-docker/nginx$ sudo docker build -t takurx/nginx:1.2 .
Sending build context to Docker daemon  4.608kB
Step 1/2 : FROM 'nginx:latest'
 ---> a99a39d070bf
Step 2/2 : RUN service nginx start
 ---> Using cache
 ---> e1d1e75925a1
Successfully built e1d1e75925a1
Successfully tagged takurx/nginx:1.2
chiya@ujimatsu:~/JetsonWorks3/test-docker/nginx$ sudo docker run takurx/nginx:1.2 -p 80:80
/docker-entrypoint.sh: 47: exec: -p: not found
chiya@ujimatsu:~/JetsonWorks3/test-docker/nginx$ sudo docker run -p 80:80 takurx/nginx:1.2
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/02/03 16:08:56 [notice] 1#1: using the "epoll" event method
2023/02/03 16:08:56 [notice] 1#1: nginx/1.23.3
2023/02/03 16:08:56 [notice] 1#1: built by gcc 10.2.1 20210110 (Debian 10.2.1-6) 
2023/02/03 16:08:56 [notice] 1#1: OS: Linux 5.15.0-58-generic
2023/02/03 16:08:56 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/02/03 16:08:56 [notice] 1#1: start worker processes
2023/02/03 16:08:56 [notice] 1#1: start worker process 29
2023/02/03 16:08:56 [notice] 1#1: start worker process 30
2023/02/03 16:08:56 [notice] 1#1: start worker process 31
2023/02/03 16:08:56 [notice] 1#1: start worker process 32
2023/02/03 16:08:56 [notice] 1#1: start worker process 33
2023/02/03 16:08:56 [notice] 1#1: start worker process 34
2023/02/03 16:08:56 [notice] 1#1: start worker process 35
2023/02/03 16:08:56 [notice] 1#1: start worker process 36
172.17.0.1 - - [03/Feb/2023:16:09:04 +0000] "GET / HTTP/1.1" 200 615 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/109.0" "-"
2023/02/03 16:09:04 [error] 29#29: *1 open() "/usr/share/nginx/html/favicon.ico" failed (2: No such file or directory), client: 172.17.0.1, server: localhost, request: "GET /favicon.ico HTTP/1.1", host: "localhost", referrer: "http://localhost/"
172.17.0.1 - - [03/Feb/2023:16:09:04 +0000] "GET /favicon.ico HTTP/1.1" 404 153 "http://localhost/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/109.0" "-"
172.17.0.1 - - [03/Feb/2023:16:09:18 +0000] "GET /index.html HTTP/1.1" 200 615 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/109.0" "-"
^C2023/02/03 16:10:16 [notice] 1#1: signal 2 (SIGINT) received, exiting
2023/02/03 16:10:16 [notice] 30#30: exiting
2023/02/03 16:10:16 [notice] 29#29: exiting
2023/02/03 16:10:16 [notice] 33#33: exiting
2023/02/03 16:10:16 [notice] 34#34: exiting
2023/02/03 16:10:16 [notice] 35#35: exiting
2023/02/03 16:10:16 [notice] 36#36: exiting
2023/02/03 16:10:16 [notice] 30#30: exit
2023/02/03 16:10:16 [notice] 29#29: exit
2023/02/03 16:10:16 [notice] 33#33: exit
2023/02/03 16:10:16 [notice] 34#34: exit
2023/02/03 16:10:16 [notice] 35#35: exit
2023/02/03 16:10:16 [notice] 36#36: exit
2023/02/03 16:10:16 [notice] 31#31: exiting
2023/02/03 16:10:16 [notice] 31#31: exit
2023/02/03 16:10:16 [notice] 32#32: exiting
2023/02/03 16:10:16 [notice] 32#32: exit
2023/02/03 16:10:16 [notice] 1#1: signal 14 (SIGALRM) received
2023/02/03 16:10:16 [notice] 1#1: signal 17 (SIGCHLD) received from 34
2023/02/03 16:10:16 [notice] 1#1: worker process 34 exited with code 0
2023/02/03 16:10:16 [notice] 1#1: worker process 32 exited with code 0
2023/02/03 16:10:16 [notice] 1#1: worker process 33 exited with code 0
2023/02/03 16:10:16 [notice] 1#1: worker process 36 exited with code 0
2023/02/03 16:10:16 [notice] 1#1: worker process 29 exited with code 0
2023/02/03 16:10:16 [notice] 1#1: signal 29 (SIGIO) received
2023/02/03 16:10:16 [notice] 1#1: signal 17 (SIGCHLD) received from 32
2023/02/03 16:10:16 [notice] 1#1: signal 17 (SIGCHLD) received from 30
2023/02/03 16:10:16 [notice] 1#1: worker process 30 exited with code 0
2023/02/03 16:10:16 [notice] 1#1: signal 29 (SIGIO) received
2023/02/03 16:10:16 [notice] 1#1: signal 17 (SIGCHLD) received from 35
2023/02/03 16:10:16 [notice] 1#1: worker process 35 exited with code 0
2023/02/03 16:10:16 [notice] 1#1: signal 29 (SIGIO) received
2023/02/03 16:10:16 [notice] 1#1: signal 17 (SIGCHLD) received from 31
2023/02/03 16:10:16 [notice] 1#1: worker process 31 exited with code 0
2023/02/03 16:10:16 [notice] 1#1: exit
chiya@ujimatsu:~/JetsonWorks3/test-docker/nginx$ sudo docker run -v $(pwd):/usr/share/nginx/html -p 80:80 takurx/nginx:1.2
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/02/03 16:10:53 [notice] 1#1: using the "epoll" event method
2023/02/03 16:10:53 [notice] 1#1: nginx/1.23.3
2023/02/03 16:10:53 [notice] 1#1: built by gcc 10.2.1 20210110 (Debian 10.2.1-6) 
2023/02/03 16:10:53 [notice] 1#1: OS: Linux 5.15.0-58-generic
2023/02/03 16:10:53 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/02/03 16:10:53 [notice] 1#1: start worker processes
2023/02/03 16:10:53 [notice] 1#1: start worker process 29
2023/02/03 16:10:53 [notice] 1#1: start worker process 30
2023/02/03 16:10:53 [notice] 1#1: start worker process 31
2023/02/03 16:10:53 [notice] 1#1: start worker process 32
2023/02/03 16:10:53 [notice] 1#1: start worker process 33
2023/02/03 16:10:53 [notice] 1#1: start worker process 34
2023/02/03 16:10:53 [notice] 1#1: start worker process 35
2023/02/03 16:10:53 [notice] 1#1: start worker process 36
172.17.0.1 - - [03/Feb/2023:16:11:08 +0000] "GET /index.html HTTP/1.1" 200 22 "-" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/109.0" "-"
^C2023/02/03 16:11:34 [notice] 1#1: signal 2 (SIGINT) received, exiting
2023/02/03 16:11:34 [notice] 29#29: exiting
2023/02/03 16:11:34 [notice] 30#30: exiting
2023/02/03 16:11:34 [notice] 31#31: exiting
2023/02/03 16:11:34 [notice] 30#30: exit
2023/02/03 16:11:34 [notice] 34#34: exiting
2023/02/03 16:11:34 [notice] 29#29: exit
2023/02/03 16:11:34 [notice] 31#31: exit
2023/02/03 16:11:34 [notice] 34#34: exit
2023/02/03 16:11:34 [notice] 33#33: exiting
2023/02/03 16:11:34 [notice] 33#33: exit
2023/02/03 16:11:34 [notice] 35#35: exiting
2023/02/03 16:11:34 [notice] 35#35: exit
2023/02/03 16:11:34 [notice] 36#36: exiting
2023/02/03 16:11:34 [notice] 32#32: exiting
2023/02/03 16:11:34 [notice] 36#36: exit
2023/02/03 16:11:34 [notice] 32#32: exit
2023/02/03 16:11:34 [notice] 1#1: signal 17 (SIGCHLD) received from 35
2023/02/03 16:11:34 [notice] 1#1: worker process 29 exited with code 0
2023/02/03 16:11:34 [notice] 1#1: worker process 35 exited with code 0
2023/02/03 16:11:34 [notice] 1#1: signal 29 (SIGIO) received
2023/02/03 16:11:34 [notice] 1#1: signal 17 (SIGCHLD) received from 29
2023/02/03 16:11:34 [notice] 1#1: signal 17 (SIGCHLD) received from 33
2023/02/03 16:11:34 [notice] 1#1: worker process 33 exited with code 0
2023/02/03 16:11:34 [notice] 1#1: signal 29 (SIGIO) received
2023/02/03 16:11:34 [notice] 1#1: signal 17 (SIGCHLD) received from 34
2023/02/03 16:11:34 [notice] 1#1: worker process 34 exited with code 0
2023/02/03 16:11:34 [notice] 1#1: signal 29 (SIGIO) received
2023/02/03 16:11:34 [notice] 1#1: signal 17 (SIGCHLD) received from 36
2023/02/03 16:11:34 [notice] 1#1: worker process 31 exited with code 0
2023/02/03 16:11:34 [notice] 1#1: worker process 30 exited with code 0
2023/02/03 16:11:34 [notice] 1#1: worker process 32 exited with code 0
2023/02/03 16:11:34 [notice] 1#1: worker process 36 exited with code 0
2023/02/03 16:11:34 [notice] 1#1: exit
chiya@ujimatsu:~/JetsonWorks3/test-docker/nginx$ 

```

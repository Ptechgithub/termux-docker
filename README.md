# Install 

```
bash <(curl -fsSL https://raw.githubusercontent.com/Ptechgithub/termux-docker/main/alpine.sh)
```


``
mkdir -p /etc/udhcpc
``

``
echo "RESOLV_CONF=\"no\"" > /etc/udhcpc/udhcpc.conf
``

``
echo "nameserver 1.1.1.1" > /etc/resolv.conf
``

``
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
``

``
setup-alpine 
``

``
rc-update add networking
``

``
poweroff
``

``
apk update
``

part2;

``
vi /etc/apk/repositories
``
Uncomment line 3

``
apk update
``

``
apk add docker
``

service docker start
service docker stop
nano alpine.sh
pkg install root-repo -y
dockerd -H tcp://127.0.0.1:2375 --iptables=false

export DOCKER_HOST=localhost:2375
echo "export DOCKER_ HOST=localhost:2375" >> ~/.bashrc ; bash

``
ssh root@localhost -p 2222

``
ssh -L 8080:localhost:80 -N -f root@localhost -p 2222
``
``
nano /etc/ssh/sshd_config 
AllowTcpForwarding yes
GatewayPorts yes
``
service sshd restart
ps -aux




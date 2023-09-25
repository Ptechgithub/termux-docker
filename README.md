# Install 

```
bash <(curl -fsSL https://raw.githubusercontent.com/Ptechgithub/termux-docker/main/alpine.sh)
```

# localhost

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

---------------------------------
# alpine

``
rc-update add networking
``

``
poweroff
``

``
apk update
``

```
ssh root@localhost -p 2222
vi /etc/ssh/sshd_config 
AllowTcpForwarding yes
GatewayPorts yes
service sshd restart

ssh -L 8080:localhost:80 -N -f root@localhost -p 2222

```
- ps -aux


# part2
## Alpine
```

vi /etc/apk/repositories

please Uncomment line 3

apk update

apk add docker
service docker start
service docker status

```

# docker in termux

pkg update -y

pkg install root-repo -y

pkg install docker -y

# alpine
```
service docker start
service docker stop
dockerd -H tcp://0.0.0.0:2074 --iptables=false
```

# termux
```
export DOCKER_HOST=localhost:2074
echo "export DOCKER_HOST=localhost:2074" >> ~/.bashrc ; bash

```

# step 3
gui

```
docker run -d -p 8000:8000 -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```







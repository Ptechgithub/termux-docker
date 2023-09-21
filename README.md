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
rc-update add networking
poweroff
apk update


part2;

vi /etc/apk/repositories
# Uncomment line 3
apk update
apk add docker
service docker start
service docker stop
nano alpine.sh

dockerd -H tcp://0.0.0.0:2375 --iptables=false

export DOCKER_HOST=localhost:2375
$ echo "export DOCKER_ HOST=localhost:2375" >> ~/.bashrc




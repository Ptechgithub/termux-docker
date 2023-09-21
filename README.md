# Install 

```
bash <(curl -fsSL https://raw.githubusercontent.com/Ptechgithub/termux-docker/main/alpine.sh)
```

``
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
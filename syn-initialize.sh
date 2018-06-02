#!/bin/sh

./syn-TUN.sh

docker run \
    --cap-add=NET_ADMIN \
	--device=/dev/net/tun \
	-d \
	-v /volume1/foldername/resolv.conf:/etc/resolv.conf \
	-v /volume1/yourpath/:/data \
	-e "OPENVPN_PROVIDER=PIA" \
	-e "OPENVPN_CONFIG=Netherlands" \
	-e "OPENVPN_USERNAME=XXXXX" \
	-e "OPENVPN_PASSWORD=XXXXX" \
	-e "LOCAL_NETWORK=192.168.0.0/24" \
	-e "OPENVPN_OPTS=--inactive 3600 --ping 10 --ping-exit 60" \
	-e "PGID=100" \
	-e "PUID=1234" \
	-p 9091:9091 \
	--sysctl net.ipv6.conf.all.disable_ipv6=0 \
	--name "transmission" \
	haugene/transmission-openvpn:latest

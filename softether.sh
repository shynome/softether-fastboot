#!/bin/sh
exec docker run \
  --name softether \
  -d --restart always \
  --cap-add NET_ADMIN \
  -v $PWD/conf_backup:/usr/vpnserver/backup.vpn_server.config/ \
  -v $PWD/vpn_server.config:/usr/vpnserver/vpn_server.config \
  -v $PWD/save_binary:/usr/vpnserver/save_binary \
  -p 500:500/udp \
  -p 4500:4500/udp \
  -p 1701:1701/tcp \
  -p 127.0.0.1:5555:5555/tcp \
  -e SPW='yourmanagerpassword' \
  shynome/softether:4.29

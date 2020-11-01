#!/bin/env bash
if [ -z $1 ] &> /dev/null;then
   echo "Por favor infome uma rede de wifi"
else
   WIRELESS="$1"
    if [ -z $2 ] &> /dev/null;then
     echo "Por favor informe uma senha"
    else
      PASSWORLD="$2"
       if [ -z $3 ] &> /dev/null;then
        echo "Por Favor informa a interface do WIFI"
       else
        WIRELESS_INTERACE="$#"
       fi
    fi
fi

wpa_passphrase "$WIRELESS" "$PASSWORLD" > /etc/wpa_supplicant.conf
ip link set $WIRELESS_INTERFACE down
ip link set $WIRELESS_INTERFACE up
wpa_supplicant -B -i$WIRELESS_INTERFACE -c /etc/wpa_supplicant.conf
dhclient $WIRELESS_INTERFACE

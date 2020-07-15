#!/bin/bash

if [ $# == 2 ]
then
        if [ ! -d "$2" ];
        then
                mkdir $2
                cd $2
                mkdir www loot info recon
                echo $2 > ip
        fi
        cd $2
        tmux new -s htb -d
        tmux send-keys -t htb:0 'sudo openvpn /opt/yz-htb/ovpn/$1' ENTER
        tmux attach -t htb
else
        echo "Usage:  $0 <ovpn_file> <machine_ip>"
	echo ""
	echo "Ovpn files:"
	ls /opt/yz-htb/ovpn
        exit 1
fi

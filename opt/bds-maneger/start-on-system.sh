#!/bin/bash

### BEGIN INIT INFO
# Provides:             bds-maneger
# Required-Start:       $network
# Required-Stop:        
# Default-Start:        2 3 4 5
# Default-Stop:         
# Short-Description:    Minecraft Manager stating Minecraft Bedrock Server
### END INIT INFO

NAME="bds"
if [[ "$EUID" -ne 0 ]]; then
echo "Você não está executando o service com root ou sudo";exit 1
fi
startsh23(){
rm -rf /tmp/mcpe.txt
screen -L -Logfile /tmp/mcpe.txt -dmS bedrock bds
}
stopsh23(){
    screen -S bedrock -p 0 -X stuff 'say server in stop in 10 Sec\n'
    sleep 5
    screen -S bedrock -p 0 -X stuff 'say server in stop in 5 Sec\n'
    sleep 5
    screen -S bedrock -p 0 -X stuff 'say server is stopping\n'
    sleep 2s
	screen -S bedrock -p 0 -X stuff 'stop\n'
    DDsD=0
    while [ true ]
    do 
        if ! screen -list | grep -q "bedrock"; then
            echo
            bds-backup
            break
        fi
    done
}

stopbackup(){
    screen -S bedrock -p 0 -X stuff 'say server in stop in 10 Sec to backup\n'
    sleep 5
    screen -S bedrock -p 0 -X stuff 'say server in stop in 5 Sec to backup\n'
    sleep 5
    screen -S bedrock -p 0 -X stuff 'say server is stopping\n'
    sleep 2s
	screen -S bedrock -p 0 -X stuff 'stop\n'
    while [ true ]
    do 
        if ! screen -list | grep -q "bedrock"; then
            echo
            bds-backup
            break
        fi
    done
}

restartsh23(){
if ! screen -list | grep -q "bedrock"; then
    echo "Servidor não está ligado ou Não foi possivel reinicia."
else
    	stopsh23
        startsh23
fi
}
case "$1" in 
    start) startsh23 ;;
    stop) stopsh23 ;;
    restart) restartsh23;;
    backup) stopbackup;startsh23;;
esac
exit 0

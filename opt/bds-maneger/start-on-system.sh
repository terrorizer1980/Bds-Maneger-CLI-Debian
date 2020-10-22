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
echo "You not execute command with sudo or root user";exit 1
fi
startsh23(){
rm -rf /tmp/mcpe.txt
screen -L -Logfile /tmp/mcpe.txt -dmS bedrock bds
}
stopnomal(){
    echo "server in stop in 10 Sec"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 10 Sec\n'
        sleep 1s
    echo "server in stop in 9 Sec"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 9 Sec\n'
        sleep 1s
    echo "server in stop in 8 Sec"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 8 Sec\n'
        sleep 1s
    echo "server in stop in 7 Sec"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 7 Sec\n'
        sleep 1s
    echo "server in stop in 6 Sec"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 6 Sec\n'
        sleep 1s
    echo "server in stop in 5 Sec"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 5 Sec\n'
        sleep 1s
    echo "server in stop in 4 Sec"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 4 Sec\n'
        sleep 1s
    echo "server in stop in 3 Sec"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 3 Sec\n'
        sleep 1s
    echo "server in stop in 2 Sec"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 2 Sec\n'
        sleep 1s
    echo "server in stop in 1 Sec"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 1 Sec\n'
        sleep 1s
    echo "server in stop in 0 Sec"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 0 Sec\n'
        sleep 1s
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

stoprestart(){
	screen -S bedrock -p 0 -X stuff 'stop\n'
    while [ true ]
    do 
        if ! screen -list | grep -q "bedrock"; then
            echo -ne "\r You Server on execute"
            break
        fi
    done
}

stopbackup(){
    echo "server in stop in 10 Sec to backup"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 10 Sec to backup\n'
        sleep 1s
    echo "server in stop in 9 Sec to backup"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 9 Sec to backup\n'
        sleep 1s
    echo "server in stop in 8 Sec to backup"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 8 Sec to backup\n'
        sleep 1s
    echo "server in stop in 7 Sec to backup"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 7 Sec to backup\n'
        sleep 1s
    echo "server in stop in 6 Sec to backup"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 6 Sec to backup\n'
        sleep 1s
    echo "server in stop in 5 Sec to backup"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 5 Sec to backup\n'
        sleep 1s
    echo "server in stop in 4 Sec to backup"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 4 Sec to backup\n'
        sleep 1s
    echo "server in stop in 3 Sec to backup"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 3 Sec to backup\n'
        sleep 1s
    echo "server in stop in 2 Sec to backup"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 2 Sec to backup\n'
        sleep 1s
    echo "server in stop in 1 Sec to backup"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 1 Sec to backup\n'
        sleep 1s
    echo "server in stop in 0 Sec to backup"
    screen -S bedrock -p 0 -X stuff 'say server in stop in 0 Sec to backup\n'
        sleep 1s
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
    echo -ne "\r Not possible restart server or server is not on execute."
else
    	stoprestart
        startsh23
fi
}
case "$1" in 
    start) startsh23 ;;
    stop) stopnomal ;;
    restart) restartsh23;;
    backup) stopbackup;startsh23;;
esac
exit 0

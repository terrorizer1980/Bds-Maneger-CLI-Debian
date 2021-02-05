#!/bin/bash

### BEGIN INIT INFO
# Provides:             bds-maneger
# Required-Start:       $network
# Required-Stop:        
# Default-Start:        2 3 4 5
# Default-Stop:         2 3 4 5 6 7 8 9
# Short-Description:    Minecraft Manager stating Minecraft Bedrock Server
### END INIT INFO

NAME="bds"
if [[ "$EUID" -ne 0 ]]; then
echo "You not execute command with sudo or root user"
exit 1
fi
startsh23(){
if ! screen -list | grep -q "bedrock"; then
    rm -rf /tmp/mcpe.txt
    screen -L -Logfile /tmp/mcpe.txt -dmS bedrock bds
else
    echo "You have one server executing"
fi
}
stopnomal(){
    if ! screen -list | grep -q "bedrock"; then
        echo -ne "\r Not possible stop server or server is not on execute."
    else
        screen -S bedrock -p 0 -X stuff 'stop\n'
        # 
        while [ true ]
        do 
            if ! screen -list | grep -q "bedrock"; then
                echo
                bds-backup
                break
            fi
        done
    fi
}

stoprestart(){
    if ! screen -list | grep -q "bedrock"; then
        echo -ne "\r Not possible stop server or server is not on execute."
    else
        screen -S bedrock -p 0 -X stuff 'stop\n'
        while [ true ]
        do 
            if ! screen -list | grep -q "bedrock"; then
                break
            fi;done
    fi
}

stopbackup(){
    if ! screen -list | grep -q "bedrock"; then
        echo -ne "\r Not possible restart server or server is not on execute."
    else
        screen -S bedrock -p 0 -X stuff 'stop\n'
        while [ true ]
        do 
            if ! screen -list | grep -q "bedrock"; then
                echo
                bds-backup
                break
            fi
        done
        startsh23
    fi
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
    backup) stopbackup;;
esac
exit 0

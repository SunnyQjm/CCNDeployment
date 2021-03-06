#!/bin/bash
#command=$(cat testCommand.sh)
echo $command
username=$1
password=$2
ip=$3
routerName=$4
/usr/bin/expect << EOD
set timeout -1

spawn ssh $username@$ip "
cd Documents/CCNDeployment;
git pull;
nohup /home/$username/software/jdk11/bin/java -jar ./CCNController-1.0.jar $routerName > controller_log.txt &
sleep 20;
nohup /home/$username/software/jdk11//bin/java --class-path ./CCNRouter-1.0.jar:. cn.pkusz.run.RouterTest $routerName > router_log.txt & 
echo $routerName deploy finish!!
"
expect {
    "(yes/no)?" {
        send "yes\r";
        expect "password:";
        send "${password}\r";
        exp_continue;
    }
    "password:" {
        send "${password}\r";
        exp_continue;
    }
}
EOD

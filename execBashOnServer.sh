#!/bin/bash
#command=$(cat testCommand.sh)
echo $command
username=$1
password=$2
ip=$3
routerName=$4
/usr/bin/expect << EOD


spawn ssh $username@$ip "
. /etc/profile
. ~/.bashrc
java -version
cd Documents/CCNDeployment;
git pull;
./controller_deploy.sh $routerName;
sleep 12;
./router_deployment.sh $routerName;
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

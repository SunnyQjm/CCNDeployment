#!/bin/bash
command=$(cat testCommand.sh)
echo $command
username=$1
password=$2
ip=$3
/usr/bin/expect << EOD


spawn ssh $username@$ip $command
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
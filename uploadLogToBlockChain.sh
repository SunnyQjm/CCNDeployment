#!/bin/bash

# 首先判断log.ini是否不为空，不为空才执行上传操作
if [ -s log.ini ]; then
    scp -i ~/pem/PKUsz1.pem log.ini root@60.205.191.3:/root/packages/PoV-DN-version/phxpaxos_test/Debug/Domain_name_list
    cat /dev/null > log.ini
fi

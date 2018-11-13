#!/bin/bash

command=$1
##########################################
### 具体执行部署到一个节点的操作
### @param routerName
### @param username
### @param password
### @ip ip
###########################################
function deploy(){
    routerName=$1
    username=$2
    password=$3
    ip=$4
    
    case $command in
    "update")
        ./update.sh $username $password $ip $routerName
        ;;
    "deploy")
        ./deploy.sh $username $password $ip $routerName
        ;;
    "kill")
        ./doKill.sh $username $password $ip $routerName
    esac
}


# 读取网络拓扑配置
json=`cat lab_topology.json`

# 保存配置列表
list=`echo $json | jq '.'`

# 获取网络拓扑的节点个数
length=`echo $json | jq '.|length'` 
length=$(( $length - 1 ))

for index in `seq 0 $length`
do
    # 获取到路由的名字
    routerName=$(echo $list | jq -r ".[$index].name")
    serverName=$(echo $routerName)
    temp_1=${serverName#*router/}
    body=${temp_1%%/*}
    temp_2=${serverName##*/}
    tag=${temp_2%\"*}
    cc=`echo $body$tag`
    username=$(echo $list | jq -r ".[$index].username")
    password=$(echo $list | jq -r ".[$index].password")
    ip=$(echo $list | jq -r ".[$index].ip")
    echo $username
    echo $password
    echo "=======================开始处理$routerName==============="
    deploy $routerName $username $password $ip &
    echo "========================================================="
done

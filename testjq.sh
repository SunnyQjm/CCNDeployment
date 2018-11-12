#!/bin/bash

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
    routerName=$(echo $list | jq ".[$index].name")
    serverName=$(echo $routerName)
    temp_1=${serverName#*router/}
    body=${temp_1%%/*}
    temp_2=${serverName##*/}
    tag=${temp_2%\"*}
    cc=`echo $body$tag`
    echo $cc
done

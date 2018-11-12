#!/bin/bash
nohup java --class-path ./CCNRouter-1.0.jar:. cn.pkusz.run.RouterTest $1 & > router_log.txt &

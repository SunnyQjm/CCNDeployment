#!/bin/bash
nohup ~/software/jdk11/bin/java --class-path ./CCNRouter-1.0.jar:. cn.pkusz.run.RouterTest $1 & > router_log.txt &

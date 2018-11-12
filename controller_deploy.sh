#!/usr/bin/env bash

# 先编译
#./gradlew shadowJar

# 运行控制器程序
nohup ~/software/jdk11/bin/java -jar ./CCNController-1.0.jar $1 & > controller_log.txt &

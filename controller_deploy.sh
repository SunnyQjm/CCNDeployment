#!/usr/bin/env bash

# 先编译
#./gradlew shadowJar

# 运行控制器程序
java -jar ./CCNController-1.0.jar $1

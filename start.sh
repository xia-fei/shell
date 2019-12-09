#!/bin/bash

echo "请将该脚本放在项目的mvn package执行的目录执行";
echo "它将执行mvn package";
echo "匹配target目录的jar文件名称,kill掉进程";

SERVER_PORT=8080;
if [[ ! -z $1 ]]; then
    SERVER_PORT=$1;
fi


mvn clean package -Dmaven.test.skip=true

JVM_OPS="-Dserver.port=$SERVER_PORT -Xmx64m"

APP_NAME=$(ls target|grep .*jar$ );
PID=$(ps -ef |grep ${APP_NAME} |grep -v grep |awk '{print $2}');

echo " ----------------------------------------"
echo "|  APP_NAME:"$APP_NAME"  PID:"${PID}  JVM_OPS=${JVM_OPS}"
echo " ----------------------------------------"

kill  $PID

sleep 2s;

nohup  java $JVM_OPS -jar  target/$APP_NAME &



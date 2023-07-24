##!/usr/bin/env bash
#
#REPOSITORY=/home/ubuntu/cicdapp
#cd $REPOSITORY
#
#APP_NAME=cicdapp
#JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep 'SNAPSHOT.jar' | tail -n 1)
#JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME
#
##APP_LOG="$APP_NAME/application.log"
##ERROR_LOG="$APP_NAME/error.log"
##DEPLOY_LOG="$APP_NAME/deploy.log"
#
#CURRENT_PID=$(pgrep -f $APP_NAME)
#
#if [ -z $CURRENT_PID ]
#then
#  echo "> 종료할 애플리케이션이 없습니다."
#else
#  echo "> kill -9 $CURRENT_PID"
#  kill -15 $CURRENT_PID
#  sleep 5
#fi
#
#echo "> Deploy - $JAR_PATH "
##nohup java -jar $JAR_PATH > /dev/null 2> /dev/null < /dev/null &
##nohup java -jar $JAR_PATH > /application.log 2> /error.log & 이 안에 범인이 있다. 이게 내 결론이다.
##nohup java -jar $JAR_PATH > /home/ubuntu/cicdapp/application.log 2> /home/ubuntu/cicdapp/error.log &
##sudo nohup java -jar $JAR_PATH > $REPOSITORY/application.log 2> $REPOSITORY/error.log &
#
#nohup java -jar $JAR_NAME > $APP_LOG 2> $ERROR_LOG &
#!/usr/bin/env bash

REPOSITORY=/home/ubuntu/cicdapp
cd $REPOSITORY

APP_NAME=cicdapp
JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep 'SNAPSHOT.jar' | tail -n 1)
JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME

CURRENT_PID=$(pgrep -f $APP_NAME)

if [ -z $CURRENT_PID ]
then
echo "> 종료할 애플리케이션이 없습니다."
else
echo "> kill -9 $CURRENT_PID"
kill -15 $CURRENT_PID
sleep 5
fi

echo "> Deploy - $JAR_PATH "
#nohup java -jar $JAR_PATH > /dev/null 2> /dev/null < /dev/null &

nohup java -jar retest-0.0.1-SNAPSHOT.jar > application.log 2> error.log &











#!/bin/sh
RESUME_PATH="$HOME/resume"
RESUME_PORT="8080"

command -v docker >/dev/null 2>&1
if [ $? != 0 ]; then curl -sSL https://get.docker.com/ | sh; fi

mkdir -p $RESUME_PATH
docker run -d --name resume_tmp zuolan/resume
if [ ! -d "$RESUME_PATH/pages" ]; then
  docker cp resume_tmp:/usr/html/user/config $RESUME_PATH/config
fi
if [ ! -d "$RESUME_PATH/pages" ]; then
  docker cp resume_tmp:/usr/html/user/pages $RESUME_PATH/pages
fi
docker rm -f resume_tmp resume >/dev/null 2>&1
docker run -d --name resume -p $RESUME_PORT:80 \
    -v $RESUME_PATH/pages:/usr/html/user/pages \
    -v $RESUME_PATH/config/:/usr/html/user/config/ \
    --restart=always zuolan/resume
echo "Done"
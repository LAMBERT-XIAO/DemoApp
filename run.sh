#!/bin/bash

buildBuilderImage() {
  echo -e "==========================================================\n"
  echo "Start to build the builer image..."

  cd ./builder
  docker build -t builder:v1 .

  echo "Build builderImage done."
  echo -e "\n=========================================================="
}

init() {
  echo -e "==========================================================\n"
  echo "Start to init the project..."

  docker-compose up -d

  echo "Init project done."
  echo "Access http://lambert.com to view the index page."
  echo -e "\n=========================================================="
}

stop() {
  echo "Stop the project..."
  docker-compose stop
  echo "Stop project done."
}

frontendDev() {
  echo "Enter to vue dev mode, you can use npm commands."
  echo `pwd`
  docker run \
    -it \
    --rm \
    --name lambert-frontend-dev \
    -p 7002:7002 \
    -v `pwd`/frontend/:/app/frontend/ \
    -w /app/frontend/modules/demo \
    builder:v1 bash
}

reloadNginxConfig() {
  docker exec -i lambert-web service nginx reload
}

printHelp() {
  operations="init builder_image stop frontend_dev reload_nginx_config"
  echo -e "Could not find your operations, you can type ./build.sh with parameter:"

  for operation in $operations
  do
    echo '  - '$operation
  done
}

case $1 in
'init')
    init
    ;;
'builder_image')
    buildBuilderImage
    ;;
'stop')
    stop
    ;;
'frontend_dev')
    frontendDev
    ;;
'reload_nginx_config')
    reloadNginxConfig
    ;;
*)
    printHelp
    ;;
esac

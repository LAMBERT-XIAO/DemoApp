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
  stop
  echo -e "==========================================================\n"
  echo "Start to init the project..."

  docker-compose up -d

  echo "Init project done."
  echo "Access http://lambert.com to view the index page."
  echo -e "\n=========================================================="
}

stop() {
  echo -e "==========================================================\n"
  echo "Stop the project..."

  docker-compose stop

  echo "Stop project done."
  echo -e "\n=========================================================="
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
    -w /app/frontend \
    builder:v1 bash
}

reloadNginxConfig() {
  docker exec -i lambert-web service nginx reload
}

generateModule() {
  echo "Generate module template..."

  docker run \
    --rm \
    --name lambert-generate-template \
    -v `pwd`/frontend/modules:/app/frontend/modules \
    -w /app/builder/ \
    builder:v1 bash -c "./generateTemplate.sh $1"
}

printHelp() {
  operations="init builder_image stop frontend_dev reload_nginx_config generate_module"
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
'generate_module')
    generateModule $2
    ;;
*)
    printHelp
    ;;
esac

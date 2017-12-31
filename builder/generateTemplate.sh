generateTemplate() {
  moduleName=$1

  if [ -z $moduleName ]
  then
    echo "Module name must not be empty, you can type ./run.sh generate_module module_name"
    return
  fi

  cd /app/frontend/modules

  if [ -e $moduleName/ ]
  then
    echo "Module already exist!"
    return
  fi

  mkdir -p $moduleName/pc && mkdir -p $moduleName/h5
  cp -r /app/builder/frontend-template/* $moduleName/pc
  cp -r /app/builder/frontend-template/* $moduleName/h5
}

generateTemplate $@
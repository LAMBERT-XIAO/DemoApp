#=== FUNCTION ================================================================
# NAME: generateTemplate
# DESCRIPTION: Generate module template including frontend and backend
# PARAMETER 1: moduleName
#===============================================================================
generateTemplate() {
  echo "Generate module template..."

  moduleName=$1

  if [ -z $moduleName ]; then
    echo "Module name must not be empty, you can type ./run.sh generate_module module_name"
    return
  fi

  if [ -e /app/frontend/modules/$moduleName/ -o -e /app/backend/modules/$moduleName/ ]; then
    echo "Module's frontend files are already exist, You need to remove them manually."
    return
  fi

  #----------------------------------------------------------------------
  # Copy template files to the directory
  #----------------------------------------------------------------------
  cd /app/frontend/modules

  mkdir -p $moduleName/pc && mkdir -p $moduleName/h5
  cp -r /app/builder/frontend-template/* $moduleName/pc
  cp -r /app/builder/frontend-template/* $moduleName/h5

  cd /app/backend/modules

  mkdir $moduleName/
  cp -r -a /app/builder/backend-template/* $moduleName/

  echo "Generate module template done."
}

generateTemplate $@

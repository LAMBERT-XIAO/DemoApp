'use strict'
require('./check-versions')()

process.env.NODE_ENV = 'production'

const buildModule = process.env.MODULE

if (!buildModule) {
  console.log('Module name must be specified, like "module=moduleName:side npm run build".')
  return
}

const [moduleName, moduleSide] = buildModule.split(':')

if ('pc' !== moduleSide && 'h5' !== moduleSide) {
  console.log('Module side must be specified as pc or h5.')
  return
}

process.env.MODULE_NAME = moduleName
process.env.MODULE_SIDE = moduleSide

const ora = require('ora')
// 类似linux的 rm -rf 操作
const rm = require('rimraf')
const path = require('path')
const chalk = require('chalk')
const webpack = require('webpack')
const config = require('../config')
const webpackConfig = require('./webpack.prod.conf')

const spinner = ora('building for production...')
spinner.start()

/*

dist
  - modules
    - demo
      - h5
        - static
          - css
          - js
        index.html
      - pc
        - static
          - css
          - js
        index.html
*/
const pathToRemove = path.join(config.build.assetsRoot, config.build.assetsSubDirectory)

rm(pathToRemove, (err) => {
  if (err)
    throw err
  // 加载prod模式的配置文件
  webpack(webpackConfig, (err, stats) => {
    spinner.stop()
    if (err)
      throw err
    process.stdout.write(stats.toString({
      colors: true,
      modules: false,
      children: false, // if you are using ts-loader, setting this to true will make tyescript errors show up during build
      chunks: false,
      chunkModules: false
    }) + '\n\n')

    if (stats.hasErrors()) {
      console.log(chalk.red('  Build failed with errors.\n'))
      process.exit(1)
    }

    console.log(chalk.cyan('  Build complete.\n'))
    console.log(chalk.yellow(
      '  Tip: built files are meant to be served over an HTTP server.\n' +
      '  Opening index.html over file:// won\'t work.\n'
    ))
  })
})

### Node镜像
* 指定WORKDIR，设置CMD为 `npm install && npm start`
* 在启动容器的时候，通过volumes将本地的代码目录挂载到容器里，因为 `npm install` 会自动执行，所以npm模块会安装

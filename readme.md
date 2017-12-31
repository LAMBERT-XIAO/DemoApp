### Node镜像
* 指定WORKDIR，设置CMD为 `npm install && npm start`
* 在启动容器的时候，通过volumes将本地的代码目录挂载到容器里，因为 `npm install` 会自动执行，所以npm模块会安装

### 增加主机的host

* 由于使用了nginx作为反向代理服务器，在本地开发时会通过域名来查找响应的server，所以需要在本机上配置相应的server，通过查看 `$projectDir/nginx/conf/backend.conf` 以及 `$projectDir/nginx/conf/frontend.conf` 中配置的 `server_name` 来配置host
* 在 `/etc/hosts` 中加入
    ```
    127.0.0.1 backend_host_name
    127.0.0.1 frontend_host_name

    ```

### 优化frontend项目的结构

* 将配置文件，node_modules等文件都移到frontend下，使模块内部仅存在
pc和h5两个目录，pc目录存放管理后台的页面，h5存放前台展示页面
* 开发时可以指定某个模块进行build，以及dev，需要通读当前webpack的打包配置，实现按模块开发和按模块进行打包。

module=demo npm run dev
module=demo npm run build

lambert.com/demo/h5/index.html/#!
lambert.com/demo/pc/index.html/#!

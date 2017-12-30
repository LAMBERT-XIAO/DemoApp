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
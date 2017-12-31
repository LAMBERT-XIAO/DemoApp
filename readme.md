### 启动脚本 run.sh
脚本中提供了如下几个操作

* init 
    使用 `docker-compose` 启动项目

* builder_image 
    构建 `builder` 镜像， `builder` 镜像中存放生成项目结构的脚本

* stop 
    停止运行中的容器

* frontend_dev 
    进入前端页面的dev模式
    
* reload_nginx_config
    当修改了 `nginx/conf` 目录下的配置时，通过该命令更新运行中nginx配置

* generate_module
    可指定模块名称生成项目结构


### 增加主机的host

* 由于使用了nginx作为反向代理服务器，在本地开发时会通过域名来查找响应的server，所以需要在本机上配置相应的server，通过查看 `$projectDir/nginx/conf/backend.conf` 以及 `$projectDir/nginx/conf/frontend.conf` 中配置的 `server_name` 来配置host
* 在 `/etc/hosts` 中加入

    ```
    127.0.0.1 backend_host_name
    127.0.0.1 frontend_host_name
    ```

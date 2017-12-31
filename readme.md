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

* chown_module_dir
    更改模块的目录权限，会在模块结构生成后自动执行

### frontend目录结构

```
frontend
├── build                       # webpack的配置文件
│   ├── build.js
│   ├── check-versions.js
│   ├── logo.png
│   ├── utils.js
│   ├── vue-loader.conf.js
│   ├── webpack.base.conf.js
│   ├── webpack.dev.conf.js
│   └── webpack.prod.conf.js
├── config                      # 存放一些build时用到的变量
│   ├── dev.env.js
│   ├── index.js
│   └── prod.env.js
├── dist                        # 存放经过webpack build之后的文件
│   └── modules
├── modules                     # 所有模块的源文件
│   └── demo
├── modules.js                  # 存放需要在启动时build的模块清单
├── package.json
├── package-lock.json
└── README.md

```

### 模块目录结构

每个模块都包含h5以及pc两个目录，分别存放给用户看的页面，以及管理员的后台页面

```
moduleName                                  # 模块名
├── h5                                      # 用户页面
│   ├── index.html                          # 用户页面的入口页面
│   ├── src
│   │   ├── App.vue
│   │   ├── assets                          # 资源文件
│   │   │   └── logo.png
│   │   ├── components                      # vue组件
│   │   │   └── HelloWorld.vue
│   │   ├── config                          # 模块内的配置文件
│   │   │   └── domain.js
│   │   ├── main.js
│   │   ├── router                          # 路由文件
│   │   │   └── index.js
│   │   └── services                        # 逻辑操作方法
│   │       └── user.js
│   └── static                              # 其他资源文件
└── pc                                      # 管理后台页面
    ├── index.html
    ├── src
    │   ├── App.vue
    │   ├── assets
    │   │   └── logo.png
    │   ├── components
    │   │   └── HelloWorld.vue
    │   ├── config
    │   │   └── domain.js
    │   ├── main.js
    │   ├── router
    │   │   └── index.js
    │   └── services
    │       └── user.js
    └── static

```


### 增加主机的host

* 由于使用了nginx作为反向代理服务器，在本地开发时会通过域名来查找响应的server，所以需要在本机上配置相应的server，通过查看 `$projectDir/nginx/conf/backend.conf` 以及 `$projectDir/nginx/conf/frontend.conf` 中配置的 `server_name` 来配置host
* 在 `/etc/hosts` 中加入

    ```
    127.0.0.1 backend_host_name
    127.0.0.1 frontend_host_name
    ```

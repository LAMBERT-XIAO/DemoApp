# 代码一定是挂载到容器里的

# 是在哪一步将代码复制进容器里，是在build镜像的时候吗

# nginx和node两个容器，是将代码复制进哪个容器里？应该是复制进一个，然后使用volumes_from

# npm install 的 node_modules 是打包在某个镜像里？

# 先将容器全部启动后，再将代码挂载到容器里才对，这样可以不用将代码打包进容器里

# 那就应该写脚本，docker-compose仅仅是将容器启动

# 那node容器不通过compose启动，感觉不太靠谱

# nodejs一个buidler镜像

# vue一个builder镜像

# 每次安装完新的module都需要更新镜像吗

# 生产阶段和开发阶段不一样，生产阶段可以直接将代码打包到容器中

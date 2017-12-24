# 拉取镜像
docker pull node

docker pull mongo

docker pull redis

docker pull nginx

# 启动容器

docker run --name lamebrt-nginx nginx

docker run --name lambert-mongo mongo

docker run --name lambert-redis redis

docker run --name lambert-node --rm -p 7001:7001 -w ${pwd}:/app --link lambert-nginx lambert-mongo lambert-redis node
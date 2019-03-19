# python3.7.2 docker 实验版
### build python 3.7.2 with docker

> 从源码构建一个常用的python3机器学习开发docker

**如果你还没有安装docker,在ubuntu下你可以使用下面命令安装:**

```shell
sudo apt install docker.io docker-compose
```
**使用下面命令让当前用户获得docker控制权**
```shell
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo systemctl restart docker
su ${USER}
```

### 构建docker
```shell
docker build -t py37 .
```

### 启动
```
docker run -it -e PASSWORD=你的jupyter密码 -p 你要服务的端:8888 py37
```
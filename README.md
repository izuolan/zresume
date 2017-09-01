# Zresume 简历主题

[![Docker Stars](https://img.shields.io/docker/stars/zuolan/resume.svg)](https://github.com/izuolan/zresume)  [![Docker Pulls](https://img.shields.io/docker/pulls/zuolan/resume.svg)](https://github.com/izuolan/zresume)  [![Docker Automated buil](https://img.shields.io/docker/automated/zuolan/resume.svg)](https://github.com/izuolan/zresume)  [![Docker Build Statu](https://img.shields.io/docker/build/zuolan/resume.svg)](https://github.com/izuolan/zresume)


这是一个 [Grav CMS](http://getgrav.org/) 的程序员简历主题。

## 特色

* 轻量，无需数据库。
* 直接使用 Markdown 编写简历，实时解析页面。
* 简历所有图标、文字、排版均在 Markdown 中设置，无需修改代码。
* 支持 Docker 一键部署，镜像体积约 30MB。

## 使用方法

### 快速启动（推荐）

```shell
curl -sSL https://git.io/Resume | bash
```

> 脚本会下载一个 30MB 左右的 Docker 镜像，端口为 8080，数据卷挂载到 `$HOME/resume` 目录。

在 `$HOME/resume` 目录中有两个文件夹，分别是 config 和 pages，前者是配置文件，后者是简历的 Markdown 源文件。

### 手动启动

首先确保你安装了 Docker，然后执行下面命令：

```shell
# 使用下面脚本快速安装 Docker：
# curl -sSL https://get.docker.com/ | sh

$ RESUME_PATH="$HOME/resume" # 设置简历存储在本地的目录
$ RESUME_PORT="8080"         # 设置访问简历的端口
$ mkdir -p $RESUME_PATH

# 获取示例文件
$ docker run -d --name resume_tmp zuolan/resume
$ docker cp resume_tmp:/usr/html/user/config $RESUME_PATH/config
$ docker cp resume_tmp:/usr/html/user/pages $RESUME_PATH/pages
$ docker rm -f resume_tmp resume

# 启动简历容器
$ docker run -d --name resume \
    -p 8080:80 \
    --restart=always \
    -v /resume/pages:/usr/html/user/pages \
    -v /resume/config/:/usr/html/user/config \
    zuolan/resume
```

### 快速获取 Github 日历

```
curl https://github.com/izuolan | awk '/<svg.+class="js-calendar-graph-svg"/,/svg>/' | sed -e 's|<svg|<svg xmlns="http://www.w3.org/2000/svg"|' | sed '/text/'d > github.svg
```

## 修改主题

如果你需要修改主题具体样式，可以把主题文件夹也挂载到数据卷中：

```shell
# 使用下面脚本快速安装 Docker：
# curl -sSL https://get.docker.com/ | sh

$ RESUME_PATH="$HOME/resume" # 设置简历存储在本地的目录
$ RESUME_PORT="8080"         # 设置访问简历的端口
$ mkdir -p $RESUME_PATH

# 获取示例文件
$ docker run -d --name resume_tmp zuolan/resume
$ docker cp resume_tmp:/usr/html/user/config $RESUME_PATH/config
$ docker cp resume_tmp:/usr/html/user/pages $RESUME_PATH/pages
$ docker cp resume_tmp:/usr/html/user/themes $RESUME_PATH/themes
$ docker rm -f resume_tmp resume

# 启动简历容器
$ docker run -d --name resume \
  -p 8080:80 \
  --restart=always \
  -v /resume/themes:/usr/html/user/themes \
  -v /resume/pages:/usr/html/user/pages \
  -v /resume/config/:/usr/html/user/config \
  zuolan/resume
```

## 协议

主题最初从 [Resume](https://github.com/getgrav/grav-theme-resume) 主题 Fork 过来，原主题很久没更新了，依旧是MIT协议开源。
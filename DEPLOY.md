# 一键部署（Docker）

## 方式一：docker compose（推荐，含 24×7 自动重启）

在本目录下执行一条命令：

    docker compose up -d --build

打开 http://localhost:8080
停止：docker compose down
看日志：docker compose logs -f

restart: unless-stopped 已设置：进程崩溃或机器重启后会自动拉起，
手动 docker compose down 才会停。

## 方式二：导出成镜像文件，拷到别的机器一键跑

本机先构建并导出：

    docker build -t wolfy-wave-index:latest .
    docker save wolfy-wave-index:latest | gzip > wolfy-wave-index.tar.gz

把 tar.gz 拷到目标机器后：

    gunzip -c wolfy-wave-index.tar.gz | docker load
    docker run -d --name wolfy-wave-index --restart unless-stopped -p 8080:80 wolfy-wave-index:latest




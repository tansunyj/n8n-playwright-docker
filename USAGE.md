# n8n 自定义镜像构建与运行指南

本目录下包含了一套完整的 n8n + Playwright + Python 自动化环境补全方案。

## 🛠️ 1. 镜像构建指令

> [!NOTE]
> 基础镜像 `n8n-base` 只需在第一次构建或依赖更新时执行。

```powershell
# 步骤 A：构建极简 Debian 基础镜像 (Node 22 + 运行库 + n8n核心)
docker build -t n8n-base:latest -f Dockerfile.base .

# 步骤 B：构建自定义镜像 (集成社区插件)
docker build -t n8n-custom:latest -f Dockerfile .
```

## ☁️ 2. 推送到 Docker Hub (591124281yj228)

建议带上版本号推送，方便以后回滚：

```powershell
# 标记并推送自定义镜像 (主要使用这个)
docker tag n8n-custom:latest 591124281yj228/n8n-playwright:2.14.2
docker push 591124281yj228/n8n-playwright:2.14.2

# (可选) 推送基础镜像
docker tag n8n-base:latest 591124281yj228/n8n-base:2.14.2
docker push 591124281yj228/n8n-base:2.14.2
```

## 🚀 3. 启动容器

```powershell
# 停止旧容器并删除残留
docker-compose down

# 启动新容器
docker-compose up -d
```

## 🌐 3. 环境初始化 (Playwright 浏览器安装)

> [!IMPORTANT]
> 必须在容器启动后执行一次。安装后的浏览器将永久保存在 `E:/docker/.n8n/browsers` 中。

```powershell
# 执行一键安装脚本
docker exec -it n8n-final setup-n8n
```

## 📂 目录结构说明
- `Dockerfile.base`: 定义底层系统环境 (Debian)。
- `Dockerfile`: 定义插件安装逻辑。
- `docker-compose.yml`: 定义容器运行参数与磁盘挂载。
- `setup.sh`: 运行时环境补全脚本（已挂载至容器内部）。
- `n8n-community-node.md`: 外部插件清单，方便管理。

## 📍 资源链接
- **Docker Hub**: [hub.docker.com/r/591124281yj228/n8n-playwright](https://hub.docker.com/r/591124281yj228/n8n-playwright)
- **GitHub Source**: [github.com/tansunyj/n8n-playwright-docker](https://github.com/tansunyj/n8n-playwright-docker)
- **构建崩溃？** 请检查 Docker Desktop 分配的内存是否达到 6GB+。
- **插件无法加载？** 检查容器日志 `docker logs -f n8n-final`。
- **更新脚本？** 直接修改本地的 `setup.sh`，无需重新构建镜像，直接再次执行 `docker exec -it n8n-final setup-n8n` 即可。

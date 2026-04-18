# n8n Playwright Docker 🚀

[English](README.md) | 简体中文

[![Docker Pulls](https://img.shields.io/docker/pulls/591124281yj228/n8n-playwright.svg)](https://hub.docker.com/r/591124281yj228/n8n-playwright)
[![Docker Image Version](https://img.shields.io/docker/v/591124281yj228/n8n-playwright?label=version)](https://hub.docker.com/r/591124281yj228/n8n-playwright)

基于 Debian (Node 22) 构建的 n8n 自定义镜像，专为 Playwright 和 Puppeteer 浏览器自动化优化。

## 📍 资源链接
- **Docker Hub**: [hub.docker.com/r/591124281yj228/n8n-playwright](https://hub.docker.com/r/591124281yj228/n8n-playwright)
- **GitHub 源码**: [github.com/tansunyj/n8n-playwright-docker](https://github.com/tansunyj/n8n-playwright-docker)

---

## 🛠️ 核心功能
- **基础操作系统**: Debian Bookworm (Slim)
- **Node.js 版本**: v22.22.2 (LTS)
- **n8n 版本**: 2.14.2
- **内置社区节点**:
  - `n8n-nodes-playwright`
  - `n8n-nodes-puppeteer`
  - `n8n-nodes-douyin-video-crawler`
  - `n8n-nodes-feishu-lite`
  - 以及更多...
- **持久化**: Playwright 浏览器存储在 `/root/.cache/ms-playwright`，已映射到持久化卷以避免重复下载。

## ⏩ 快速开始 (使用 Docker Compose)

```yaml
services:
  n8n:
    image: 591124281yj228/n8n-playwright:2.14.2
    container_name: n8n-final
    environment:
      - N8N_COMMUNITY_PACKAGES_ENABLED=true
      - PLAYWRIGHT_BROWSERS_PATH=/root/.cache/ms-playwright
      - PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
    volumes:
      - E:/docker/.n8n:/home/node/.n8n
      - E:/docker/.n8n/browsers:/root/.cache/ms-playwright
```

## ⚙️ 环境初始化
容器启动后，请运行一次以下命令来安装浏览器：
```bash
docker exec -it n8n-final setup-n8n
```

## 👤 维护者
- **Docker Hub**: 591124281yj228

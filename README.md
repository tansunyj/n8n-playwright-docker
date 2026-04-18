# n8n Playwright Docker 🚀

[![Docker Pulls](https://img.shields.io/docker/pulls/591124281yj228/n8n-playwright.svg)](https://hub.docker.com/r/591124281yj228/n8n-playwright)
[![Docker Image Version](https://img.shields.io/docker/v/591124281yj228/n8n-playwright?label=version)](https://hub.docker.com/r/591124281yj228/n8n-playwright)

基于 Debian (Node 22) 构建的 n8n 自定义镜像，专为 Playwright 和 Puppeteer 浏览器自动化优化。

## 📍 资源链接
- **Docker Hub**: [hub.docker.com/r/591124281yj228/n8n-playwright](https://hub.docker.com/r/591124281yj228/n8n-playwright)
- **GitHub Source**: [github.com/tansunyj/n8n-playwright-docker](https://github.com/tansunyj/n8n-playwright-docker)

---

## 🛠️ Key Features
- **Base OS**: Debian Bookworm (Slim)
- **Node.js**: v22.22.2 (LTS)
- **n8n Version**: 2.14.2
- **Pre-installed Nodes**:
  - `n8n-nodes-playwright`
  - `n8n-nodes-puppeteer`
  - `n8n-nodes-douyin-video-crawler`
  - `n8n-nodes-feishu-lite`
  - and more...
- **Persistence**: Playwright browsers are stored in `/root/.cache/ms-playwright`, mapped to persistent volumes to avoid re-downloading.

## Quick Start (with Docker Compose)

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

## Setup Instructions
After starting the container, run the following command once to install the browsers:
```bash
docker exec -it n8n-final setup-n8n
```

## Maintainer
- **Docker Hub**: 591124281yj228

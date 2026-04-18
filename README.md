# n8n Custom Image (Playwright Enabled)

This is a custom n8n image based on Debian (Node 22), specifically optimized for browser automation using Playwright and Puppeteer.

## Key Features
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

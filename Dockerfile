# -----------------------------------------------------------
# 文件名: Dockerfile
# 目标: 安装插件，配置运行时环境
# -----------------------------------------------------------
FROM n8n-base:latest

LABEL maintainer="591124281yj228" \
      version="2.14.2" \
      description="Custom n8n image with Playwright, Puppeteer and community nodes"

USER root

# 1. 环境变量
ENV N8N_COMMUNITY_PACKAGES_ENABLED=true \
    NODE_PATH=/usr/local/lib/node_modules \
    PLAYWRIGHT_BROWSERS_PATH=/home/node/.cache/ms-playwright

# 2. 批量安装插件
RUN npm install -g --ignore-scripts --unsafe-perm \
    youtube-transcript \
    puppeteer-extra-plugin-stealth \
    puppeteer-extra-plugin-user-preferences \
    @apify/n8n-nodes-apify \
    @rsraven/n8n-nodes-ytdlp-transcript \
    @searchapi/n8n-nodes-searchapi \
    @tavily/n8n-nodes-tavily \
    @vlm-run/n8n-nodes-vlmrun \
    n8n-nodes-douyin-video-crawler \
    n8n-nodes-make-pdf \
    n8n-nodes-playwright \
    n8n-nodes-puppeteer \
    n8n-nodes-qrcode \
    n8n-nodes-serpapi \
    n8n-nodes-feishu-lite

# 3. 复制初始化脚本并设置为全局命令
COPY setup.sh /usr/local/bin/setup-n8n
RUN chmod +x /usr/local/bin/setup-n8n

# 权限修正
RUN chown -R node:node /usr/local/lib/node_modules /home/node

USER node
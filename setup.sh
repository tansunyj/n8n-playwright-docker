#!/bin/bash
set -e

echo "开始初始化 n8n 环境..."

# 1. 安装核心浏览器
echo "正在安装 Playwright Chromium 浏览器..."
npx playwright install chromium

# 2. 检查安装情况
echo "验证安装结果:"
npx playwright --version
python3 --version
ffmpeg -version | head -n 1

# 3. 设置必要的符号链接 (解决 n8n-nodes-playwright 的特定路径要求)
echo "正在配置插件兼容性与系统 PATH 软链接..."
# A. 针对 n8n-nodes-playwright 插件的硬编码路径
mkdir -p /root/.cache/ms-playwright/chromium-1217/chrome-linux/
REAL_CHROME=$(find /root/.cache/ms-playwright -name "chrome" -type f | head -n 1)

if [ -n "$REAL_CHROME" ]; then
    # B. 建立插件专用链接
    ln -sf "$REAL_CHROME" /root/.cache/ms-playwright/chromium-1217/chrome-linux/chrome
    echo "插件软链接已建立: /root/.cache/ms-playwright/chromium-1217/chrome-linux/chrome"
    
    # C. 【新增】添加到系统全局 PATH (让 chromium 命令在任何地方都可用)
    ln -sf "$REAL_CHROME" /usr/local/bin/chromium
    ln -sf "$REAL_CHROME" /usr/local/bin/chrome
    echo "系统 PATH 链接已建立: /usr/local/bin/chromium"
fi

echo "------------------------------------------------"
echo "✅ 环境初始化完成！请重启 n8n 容器以刷新插件状态。"
echo "------------------------------------------------"

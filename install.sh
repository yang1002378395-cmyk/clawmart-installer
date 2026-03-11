#!/bin/bash
# ClawMart 一键安装脚本 v2.0
# 支持 macOS (Intel/Apple Silicon)
# 预装 10+ 主流实用 Skills

set -e

echo "🦞 ClawMart 一键安装 v2.0"
echo "========================="
echo ""

# 检测系统
OS=$(uname -s)
ARCH=$(uname -m)

if [ "$OS" != "Darwin" ]; then
    echo "❌ 此脚本仅支持 macOS，Windows 用户请使用 install.ps1"
    exit 1
fi

echo "✅ 检测到 macOS ($ARCH)"

# 检查 Homebrew
if ! command -v brew &> /dev/null; then
    echo "📦 安装 Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 安装基础依赖
echo "📦 安装基础依赖..."

# Python 3
if ! command -v python3 &> /dev/null; then
    echo "  📦 Python 3..."
    brew install python@3.11
fi

# Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
    if [ "$NODE_VERSION" -ge 18 ]; then
        echo "  ✅ Node.js $(node -v)"
    else
        echo "  📦 升级 Node.js..."
        brew install node@20
    fi
else
    echo "  📦 Node.js..."
    brew install node@20
fi

# FFmpeg（视频/音频处理）
if ! command -v ffmpeg &> /dev/null; then
    echo "  📦 FFmpeg（视频/音频处理）..."
    brew install ffmpeg
else
    echo "  ✅ FFmpeg"
fi

# Pandoc（文档转换）
if ! command -v pandoc &> /dev/null; then
    echo "  📦 Pandoc（文档转换）..."
    brew install pandoc
else
    echo "  ✅ Pandoc"
fi

# Python 依赖
echo "📦 安装 Python 依赖..."
pip3 install --quiet pandas openpyxl Pillow PyPDF2 requests beautifulsoup4 lxml 2>/dev/null || \
    pip install --quiet pandas openpyxl Pillow PyPDF2 requests beautifulsoup4 lxml

# 安装 OpenClaw
echo ""
echo "📦 安装 OpenClaw..."
if command -v openclaw &> /dev/null; then
    echo "✅ OpenClaw 已安装，版本: $(openclaw --version 2>/dev/null || echo '未知')"
else
    npm install -g openclaw
    echo "✅ OpenClaw 安装完成"
fi

# 创建配置目录
echo ""
echo "📁 创建配置目录..."
mkdir -p ~/.openclaw/workspace/skills
mkdir -p ~/.openclaw/workspace/memory

# 安装预设 Skills
echo ""
echo "📦 安装预设 Skills..."

SKILLS_DIR=~/.openclaw/workspace/skills

# 如果有本地 skills 目录，复制过去
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -d "$SCRIPT_DIR/skills" ]; then
    echo "  📂 从本地安装 Skills..."
    for skill_dir in "$SCRIPT_DIR/skills"/*/; do
        skill_name=$(basename "$skill_dir")
        mkdir -p "$SKILLS_DIR/$skill_name"
        cp -r "$skill_dir"* "$SKILLS_DIR/$skill_name/" 2>/dev/null
        echo "    ✅ $skill_name"
    done
else
    # 在线安装（fallback）
    echo "  📂 在线下载 Skills..."
    
    # Excel 处理
    mkdir -p "$SKILLS_DIR/excel-processor"
    cat > "$SKILLS_DIR/excel-processor/SKILL.md" << 'SKILL_EOF'
---
name: excel-processor
version: 1.0.0
description: Excel 表格处理 - 读取、编辑、转换 Excel/CSV 文件
license: MIT
---

# Excel 表格处理

强大的 Excel/CSV 数据处理能力。

## 使用方法

```
读取 data.xlsx，显示前 10 行
```

```
清洗这个 Excel，去除重复行
```
SKILL_EOF

    # 网页抓取
    mkdir -p "$SKILLS_DIR/web-scraper"
    cat > "$SKILLS_DIR/web-scraper/SKILL.md" << 'SKILL_EOF'
---
name: web-scraper
version: 1.0.0
description: 网页数据抓取 - 抓取网页内容、提取数据
license: MIT
---

# 网页数据抓取

轻松抓取网页数据。

## 使用方法

```
抓取 https://example.com 的所有文章标题
```
SKILL_EOF

    # 图片处理
    mkdir -p "$SKILLS_DIR/image-toolkit"
    cat > "$SKILLS_DIR/image-toolkit/SKILL.md" << 'SKILL_EOF'
---
name: image-toolkit
version: 1.0.0
description: 图片处理工具 - 调整尺寸、压缩、格式转换
license: MIT
---

# 图片处理工具

一站式图片处理解决方案。

## 使用方法

```
将 image.jpg 调整为 800x600
```

```
将所有 PNG 转换为 JPG
```
SKILL_EOF

    # 视频处理
    mkdir -p "$SKILLS_DIR/video-editor"
    cat > "$SKILLS_DIR/video-editor/SKILL.md" << 'SKILL_EOF'
---
name: video-editor
version: 1.0.0
description: 视频处理工具 - 剪辑、压缩、格式转换
license: MIT
---

# 视频处理工具

强大的视频处理能力。

## 使用方法

```
裁剪 video.mp4 从 10 秒到 30 秒
```

```
将 video.mov 转换为 MP4
```
SKILL_EOF

    # PDF 处理
    mkdir -p "$SKILLS_DIR/pdf-toolkit"
    cat > "$SKILLS_DIR/pdf-toolkit/SKILL.md" << 'SKILL_EOF'
---
name: pdf-toolkit
version: 1.0.0
description: PDF 处理工具 - 合并、拆分、压缩、转换
license: MIT
---

# PDF 处理工具

一站式 PDF 处理方案。

## 使用方法

```
合并 file1.pdf 和 file2.pdf
```

```
将 report.pdf 转换为图片
```
SKILL_EOF
fi

# 统计安装的 Skills
SKILL_COUNT=$(ls -d "$SKILLS_DIR"/*/ 2>/dev/null | wc -l | tr -d ' ')
echo ""
echo "✅ 已安装 $SKILL_COUNT 个 Skills"

# 创建记忆体模板
echo ""
echo "📝 创建记忆体模板..."

MEMORY_DIR=~/.openclaw/workspace/memory

cat > "$MEMORY_DIR/MEMORY.md" << 'MEMORY_EOF'
# MEMORY.md - 长期记忆

这是你的长期记忆文件，AI 会自动读写这里。

## 身份
- 你是谁？填在这里

## 核心项目
- 当前项目填在这里

## 工作原则
- 你的工作原则填在这里
MEMORY_EOF

cat > "$MEMORY_DIR/USER.md" << 'USER_EOF'
# USER.md - 用户信息

- **姓名**：
- **称呼**：
- **时区**：Asia/Shanghai (UTC+8)

## 偏好
- 你喜欢的沟通风格
- 你的工作习惯
USER_EOF

echo "✅ 记忆体模板创建完成"

# 验证安装
echo ""
echo "🔍 验证安装..."

python3 --version &>/dev/null && echo "  ✅ Python 3"
node --version &>/dev/null && echo "  ✅ Node.js"
ffmpeg -version &>/dev/null && echo "  ✅ FFmpeg"
pandoc --version &>/dev/null && echo "  ✅ Pandoc"
openclaw --version &>/dev/null && echo "  ✅ OpenClaw" || echo "  ⚠️  OpenClaw 配置待完成"

# 配置向导
echo ""
echo "🎉 安装完成！"
echo ""
echo "📋 已安装的功能："
echo "  • OpenClaw 核心"
echo "  • Excel 表格处理"
echo "  • 网页数据抓取"
echo "  • 图片处理工具"
echo "  • 视频处理工具"
echo "  • PDF 处理工具"
echo "  • 文档格式转换"
echo "  • 音频处理工具"
echo "  • 数据清洗工具"
echo "  • 快速翻译"
echo "  • Git 提交助手"
echo ""
echo "📋 下一步："
echo "1. 运行配置向导："
echo "   openclaw configure"
echo ""
echo "2. 选择你的 AI 模型："
echo "   - DeepSeek (推荐，便宜): https://platform.deepseek.com"
echo "   - GLM-4 (国产): https://open.bigmodel.cn"
echo "   - OpenAI: https://platform.openai.com"
echo ""
echo "3. 获取 API Key 后填入配置"
echo ""
echo "4. 测试："
echo "   openclaw chat \"帮我读取一个 Excel 文件\""
echo ""
echo "📚 文档: https://docs.openclaw.ai"
echo "🦞 ClawMart: https://github.com/yang1002378395-cmyk/clawmart-installer"
echo ""
echo "💰 觉得有用？打赏支持："
echo "   USDT (TRC20): TYTvuzacfUgeei36NK9dmfUCKFqiQfYizp"
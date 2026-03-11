#!/bin/bash
# ClawMart 一键安装脚本
# 支持 macOS (Intel/Apple Silicon)

set -e

echo "🦞 ClawMart 一键安装"
echo "===================="

# 检测系统
OS=$(uname -s)
ARCH=$(uname -m)

if [ "$OS" != "Darwin" ]; then
    echo "❌ 此脚本仅支持 macOS，Windows 用户请使用 install.ps1"
    exit 1
fi

echo "✅ 检测到 macOS ($ARCH)"

# 检查 Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
    if [ "$NODE_VERSION" -ge 18 ]; then
        echo "✅ Node.js $(node -v) 已安装"
    else
        echo "⚠️  Node.js 版本过低，需要 18+"
        echo "📦 正在安装 Node.js..."
        if command -v brew &> /dev/null; then
            brew install node@20
        else
            echo "❌ 请先安装 Homebrew: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
            exit 1
        fi
    fi
else
    echo "📦 正在安装 Node.js..."
    if command -v brew &> /dev/null; then
        brew install node@20
    else
        echo "❌ 请先安装 Homebrew"
        exit 1
    fi
fi

# 安装 OpenClaw
echo "📦 安装 OpenClaw..."
if command -v openclaw &> /dev/null; then
    echo "✅ OpenClaw 已安装，版本: $(openclaw --version)"
else
    npm install -g openclaw
    echo "✅ OpenClaw 安装完成"
fi

# 创建配置目录
echo "📁 创建配置目录..."
mkdir -p ~/.openclaw/workspace
mkdir -p ~/.openclaw/workspace/skills
mkdir -p ~/.openclaw/workspace/memory

# 下载预设 Skills
echo "📦 下载预设 Skills..."
SKILLS_DIR=~/.openclaw/workspace/skills

# 快速报价
mkdir -p "$SKILLS_DIR/quick-proposal"
cat > "$SKILLS_DIR/quick-proposal/SKILL.md" << 'SKILL_EOF'
---
name: quick-proposal
version: 1.0.0
description: 根据客户需求自动生成专业报价单
license: MIT
---

# 快速报价

根据客户需求自动生成专业报价单，包含项目拆解、工时估算、价格明细。

## 使用方式

```
帮我生成报价，客户是 XX 公司，需求是 YY
```

## 输出示例

📋 项目报价单
客户：XX 科技有限公司
项目：小程序开发
...
SKILL_EOF

# 价格监控
mkdir -p "$SKILLS_DIR/price-monitor"
cat > "$SKILLS_DIR/price-monitor/SKILL.md" << 'SKILL_EOF'
---
name: price-monitor
version: 1.0.0
description: 监控竞品价格变化，自动提醒
license: MIT
---

# 价格监控

监控竞品价格变化，达到目标价格自动提醒。

## 使用方式

```
帮我监控 XX 产品的价格，低于 ¥100 提醒我
```
SKILL_EOF

# 客户跟进
mkdir -p "$SKILLS_DIR/follow-up-agent"
cat > "$SKILLS_DIR/follow-up-agent/SKILL.md" << 'SKILL_EOF'
---
name: follow-up-agent
version: 1.0.0
description: 自动跟进客户，生成跟进邮件
license: MIT
---

# 客户跟进

自动记录跟进时间，生成跟进邮件，提醒再次跟进。

## 使用方式

```
记录客户张总需要下周三跟进
```
SKILL_EOF

echo "✅ 预设 Skills 安装完成"

# 创建记忆体模板
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

# 配置向导
echo ""
echo "🎉 安装完成！"
echo ""
echo "📋 下一步："
echo "1. 运行配置向导："
echo "   openclaw configure"
echo ""
echo "2. 选择你的 AI 模型："
echo "   - DeepSeek (推荐，便宜): https://platform.deepseek.com"
echo "   - OpenAI: https://platform.openai.com"
echo "   - Anthropic: https://console.anthropic.com"
echo ""
echo "3. 获取 API Key 后填入配置"
echo ""
echo "4. 测试："
echo "   openclaw chat \"你好\""
echo ""
echo "📚 文档: https://docs.openclaw.ai"
echo "🦞 ClawMart: https://github.com/yang1002378395-cmyk/clawmart-installer"
echo ""
echo "💰 觉得有用？打赏支持："
echo "   USDT (TRC20): TYTvuzacfUgeei36NK9dmfUCKFqiQfYizp"
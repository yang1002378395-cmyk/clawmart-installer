# ClawMart 一键安装脚本 (Windows)
# PowerShell 脚本，管理员权限运行

Write-Host "🦞 ClawMart 一键安装" -ForegroundColor Cyan
Write-Host "====================" -ForegroundColor Cyan

# 检测系统
$OS = [System.Environment]::OSVersion.Platform
$Arch = [System.Environment]::GetEnvironmentVariable("PROCESSOR_ARCHITECTURE")

Write-Host "✅ 检测到 Windows ($Arch)" -ForegroundColor Green

# 检查 Node.js
$nodeInstalled = Get-Command node -ErrorAction SilentlyContinue
if ($nodeInstalled) {
    $nodeVersion = (node -v) -replace 'v', '' -split '\.' | Select-Object -First 1
    if ([int]$nodeVersion -ge 18) {
        Write-Host "✅ Node.js $(node -v) 已安装" -ForegroundColor Green
    } else {
        Write-Host "⚠️  Node.js 版本过低，需要 18+" -ForegroundColor Yellow
        $installNode = Read-Host "是否自动安装 Node.js? (y/n)"
        if ($installNode -eq 'y') {
            winget install OpenJS.NodeJS.LTS
        }
    }
} else {
    Write-Host "📦 正在安装 Node.js..." -ForegroundColor Yellow
    $installNode = Read-Host "是否自动安装 Node.js? (y/n)"
    if ($installNode -eq 'y') {
        winget install OpenJS.NodeJS.LTS
    } else {
        Write-Host "❌ 请手动安装 Node.js 18+: https://nodejs.org" -ForegroundColor Red
        exit 1
    }
}

# 安装 OpenClaw
Write-Host "📦 安装 OpenClaw..." -ForegroundColor Yellow
$openclawInstalled = Get-Command openclaw -ErrorAction SilentlyContinue
if ($openclawInstalled) {
    Write-Host "✅ OpenClaw 已安装" -ForegroundColor Green
} else {
    npm install -g openclaw
    Write-Host "✅ OpenClaw 安装完成" -ForegroundColor Green
}

# 创建配置目录
Write-Host "📁 创建配置目录..." -ForegroundColor Yellow
$openclawDir = "$env:USERPROFILE\.openclaw"
$workspaceDir = "$openclawDir\workspace"
$skillsDir = "$workspaceDir\skills"
$memoryDir = "$workspaceDir\memory"

New-Item -ItemType Directory -Force -Path $skillsDir | Out-Null
New-Item -ItemType Directory -Force -Path $memoryDir | Out-Null

# 下载预设 Skills
Write-Host "📦 安装预设 Skills..." -ForegroundColor Yellow

# 快速报价
$quickProposalDir = "$skillsDir\quick-proposal"
New-Item -ItemType Directory -Force -Path $quickProposalDir | Out-Null
@"
---
name: quick-proposal
version: 1.0.0
description: 根据客户需求自动生成专业报价单
license: MIT
---

# 快速报价

根据客户需求自动生成专业报价单，包含项目拆解、工时估算、价格明细。

## 使用方式

``````
帮我生成报价，客户是 XX 公司，需求是 YY
``````
"@ | Out-File -FilePath "$quickProposalDir\SKILL.md" -Encoding UTF8

# 价格监控
$priceMonitorDir = "$skillsDir\price-monitor"
New-Item -ItemType Directory -Force -Path $priceMonitorDir | Out-Null
@"
---
name: price-monitor
version: 1.0.0
description: 监控竞品价格变化，自动提醒
license: MIT
---

# 价格监控

监控竞品价格变化，达到目标价格自动提醒。

## 使用方式

``````
帮我监控 XX 产品的价格，低于 ¥100 提醒我
``````
"@ | Out-File -FilePath "$priceMonitorDir\SKILL.md" -Encoding UTF8

Write-Host "✅ 预设 Skills 安装完成" -ForegroundColor Green

# 创建记忆体模板
Write-Host "📝 创建记忆体模板..." -ForegroundColor Yellow

@"
# MEMORY.md - 长期记忆

这是你的长期记忆文件，AI 会自动读写这里。

## 身份
- 你是谁？填在这里

## 核心项目
- 当前项目填在这里
"@ | Out-File -FilePath "$memoryDir\MEMORY.md" -Encoding UTF8

@"
# USER.md - 用户信息

- **姓名**：
- **称呼**：
- **时区**：Asia/Shanghai (UTC+8)

## 偏好
- 你喜欢的沟通风格
"@ | Out-File -FilePath "$memoryDir\USER.md" -Encoding UTF8

Write-Host "✅ 记忆体模板创建完成" -ForegroundColor Green

# 完成
Write-Host ""
Write-Host "🎉 安装完成！" -ForegroundColor Green
Write-Host ""
Write-Host "📋 下一步：" -ForegroundColor Cyan
Write-Host "1. 运行配置向导："
Write-Host "   openclaw configure"
Write-Host ""
Write-Host "2. 选择你的 AI 模型："
Write-Host "   - DeepSeek (推荐): https://platform.deepseek.com"
Write-Host "   - OpenAI: https://platform.openai.com"
Write-Host ""
Write-Host "3. 获取 API Key 后填入配置"
Write-Host ""
Write-Host "4. 测试："
Write-Host "   openclaw chat `"你好`""
Write-Host ""
Write-Host "💰 打赏支持：" -ForegroundColor Yellow
Write-Host "   USDT (TRC20): TYTvuzacfUgeei36NK9dmfUCKFqiQfYizp"
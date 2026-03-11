# 🦞 ClawMart - OpenClaw 一键安装

**10 分钟搭建你的 AI 助手，预装 10+ 主流实用 Skills**

## ✨ 特点

- 🚀 **一键安装** - 自动安装 OpenClaw + 所有依赖
- 📦 **预装 Skills** - Excel、网页抓取、图片、视频、PDF 等
- 🍎 **支持 Mac** - Intel 和 Apple Silicon 都支持
- 🆓 **完全免费** - 开源，自己搭建

## 📦 预装 Skills

| Skill | 功能 | 依赖 |
|-------|------|------|
| 📊 Excel 处理 | 读取/编辑/转换 Excel/CSV | pandas, openpyxl |
| 🌐 网页抓取 | 抓取网页数据 | requests, beautifulsoup4 |
| 🖼️ 图片处理 | 调整尺寸/压缩/转换 | Pillow |
| 🎬 视频处理 | 剪辑/压缩/转换 | FFmpeg |
| 📄 PDF 处理 | 合并/拆分/转换 | PyPDF2 |
| 📝 文档转换 | Word/Markdown/HTML 互转 | Pandoc |
| 🎵 音频处理 | 格式转换/剪辑 | FFmpeg |
| 🧹 数据清洗 | 去重/填充/验证 | pandas |
| 🔤 快速翻译 | 多语言翻译 | OpenClaw |
| 🌳 Git 助手 | Commit 生成/PR 管理 | Git |

## 🚀 安装

### 方式 1：一键安装（推荐）

```bash
curl -fsSL https://raw.githubusercontent.com/yang1002378395-cmyk/clawmart-installer/main/install.sh | bash
```

### 方式 2：手动安装

```bash
# 克隆仓库
git clone https://github.com/yang1002378395-cmyk/clawmart-installer.git
cd clawmart-installer

# 运行安装脚本
chmod +x install.sh
./install.sh
```

## ⚙️ 配置

安装完成后运行：

```bash
openclaw configure
```

选择你的 AI 模型：
- **DeepSeek** (推荐，便宜): https://platform.deepseek.com
- **GLM-4** (国产): https://open.bigmodel.cn
- **OpenAI**: https://platform.openai.com

获取 API Key 后填入配置即可使用。

## 💡 使用示例

### Excel 处理

```
帮我读取 sales.xlsx，统计每月销售额
```

### 网页抓取

```
抓取 https://example.com 的所有文章标题
```

### 图片处理

```
将 images/ 下所有图片调整为 800x600
```

### 视频处理

```
将 video.mp4 压缩到 50MB 以内
```

### PDF 处理

```
合并 file1.pdf 和 file2.pdf
```

## 🧪 测试安装

```bash
# 检查安装
python3 --version
node --version
ffmpeg -version
pandoc --version
openclaw --version

# 测试 Skill
openclaw chat "帮我读取一个 Excel 文件"
```

## 📊 版本历史

### v1.1.0 (2026-03-11)
- ✨ 新增 10 个主流实用 Skills
- ✨ 自动安装 FFmpeg, Pandoc 等依赖
- ✨ 改进安装脚本，支持离线安装
- 🐛 修复 Apple Silicon 兼容性问题

### v1.0.0 (2026-03-10)
- 🎉 首次发布
- ✨ OpenClaw 核心安装
- ✨ 基础 Skills 预装

## 🤝 支持

- 📚 文档: https://docs.openclaw.ai
- 💬 社区: https://discord.com/invite/clawd
- 🐛 问题: https://github.com/yang1002378395-cmyk/clawmart-installer/issues

## 💰 打赏

觉得有用？打赏支持开发：

```
USDT (TRC20): TYTvuzacfUgeei36NK9dmfUCKFqiQfYizp
```

## 📄 License

MIT License - 自由使用、修改、分发

---

**🦞 ClawMart** - 让 AI 触手可及
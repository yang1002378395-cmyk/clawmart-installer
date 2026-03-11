---
name: web-scraper
version: 1.0.0
description: 网页数据抓取 - 抓取网页内容、提取数据、自动翻页。适合：数据采集、价格监控、内容爬取。
license: MIT
metadata:
  openclaw:
    emoji: "🌐"
    requires:
      bins: ["python3"]
      python: ["requests", "beautifulsoup4", "lxml"]
---

# 网页数据抓取 Skill

轻松抓取网页数据。

## 核心功能

### 1. 内容抓取
- 抓取网页文本
- 提取链接
- 下载图片/文件

### 2. 数据提取
- CSS 选择器
- XPath 提取
- 正则匹配

### 3. 高级功能
- 自动翻页
- 登录态抓取
- 反爬虫绕过

## 使用方法

### 抓取网页

```
抓取 https://example.com 的所有文章标题
```

### 提取数据

```
从这个页面提取所有商品价格
```

### 批量抓取

```
批量抓取列表页的前 10 页数据
```

## 技术依赖

- Python 3.8+
- requests
- beautifulsoup4
- lxml

---

创建：2026-03-11
作者：ClawMart
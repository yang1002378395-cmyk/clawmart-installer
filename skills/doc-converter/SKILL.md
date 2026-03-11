---
name: doc-converter
version: 1.0.0
description: 文档格式转换 - Word/Markdown/HTML/PDF 互转。适合：办公、写作、内容迁移。
license: MIT
metadata:
  openclaw:
    emoji: "📝"
    requires:
      bins: ["pandoc"]
---

# 文档格式转换 Skill

多格式文档互转。

## 核心功能

### 1. 格式转换
- Word ↔ Markdown
- Markdown ↔ HTML
- Word ↔ PDF
- HTML ↔ PDF

### 2. 批量转换
- 批量处理文件夹
- 保持目录结构
- 自动重命名

### 3. 样式保持
- 保留格式
- 保留图片
- 保留表格

## 使用方法

### Word 转 Markdown

```
将 document.docx 转换为 Markdown
```

### Markdown 转 HTML

```
将 README.md 转换为 HTML
```

### 批量转换

```
将 docs/ 目录下所有 Word 文档转为 Markdown
```

## 技术依赖

- Pandoc

---

创建：2026-03-11
作者：ClawMart
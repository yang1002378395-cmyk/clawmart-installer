---
name: pdf-toolkit
version: 1.0.0
description: PDF 处理工具 - 合并、拆分、压缩、转换 PDF。适合：办公、文档处理。
license: MIT
metadata:
  openclaw:
    emoji: "📄"
    requires:
      bins: ["python3"]
      python: ["PyPDF2", "pdf2image"]
---

# PDF 处理工具 Skill

一站式 PDF 处理方案。

## 核心功能

### 1. PDF 操作
- 合并多个 PDF
- 拆分 PDF 页面
- 提取指定页面

### 2. 格式转换
- PDF 转 Word
- PDF 转 图片
- 图片转 PDF

### 3. PDF 优化
- 压缩 PDF 大小
- 加密/解密 PDF
- 添加水印

## 使用方法

### 合并 PDF

```
合并 file1.pdf 和 file2.pdf 为 merged.pdf
```

### 拆分 PDF

```
拆分 document.pdf 为单页
```

### PDF 转图片

```
将 report.pdf 转换为 JPG 图片
```

### 压缩 PDF

```
压缩 large.pdf 到 5MB 以内
```

## 技术依赖

- Python 3.8+
- PyPDF2
- pdf2image

---

创建：2026-03-11
作者：ClawMart
---
name: image-toolkit
version: 1.0.0
description: 图片处理工具 - 调整尺寸、压缩、格式转换、批量处理。适合：设计师、运营、内容创作者。
license: MIT
metadata:
  openclaw:
    emoji: "🖼️"
    requires:
      bins: ["python3"]
      python: ["Pillow"]
---

# 图片处理工具 Skill

一站式图片处理解决方案。

## 核心功能

### 1. 基础操作
- 调整尺寸
- 裁剪图片
- 旋转翻转

### 2. 格式转换
- PNG ↔ JPG ↔ WEBP
- 批量转换
- 透明度处理

### 3. 优化处理
- 图片压缩
- 质量调整
- 元数据清理

### 4. 批量处理
- 批量重命名
- 批量加水印
- 批量调整尺寸

## 使用方法

### 调整尺寸

```
将 image.jpg 调整为 800x600
```

### 格式转换

```
将所有 PNG 图片转换为 JPG
```

### 添加水印

```
给图片添加水印 "ClawMart"
```

### 批量压缩

```
压缩 images/ 目录下所有图片，质量 80%
```

## 技术依赖

- Python 3.8+
- Pillow (PIL)

---

创建：2026-03-11
作者：ClawMart
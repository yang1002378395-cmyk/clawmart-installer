---
name: data-cleaner
version: 1.0.0
description: 数据清洗工具 - 去重、填充、格式化、验证数据。适合：数据分析、数据迁移。
license: MIT
metadata:
  openclaw:
    emoji: "🧹"
    requires:
      bins: ["python3"]
      python: ["pandas"]
---

# 数据清洗工具 Skill

让数据清洗变得简单。

## 核心功能

### 1. 数据去重
- 检测重复行
- 智能合并
- 保留最新记录

### 2. 数据填充
- 空值填充
- 平均值填充
- 前值填充

### 3. 数据格式化
- 日期格式统一
- 数字格式化
- 文本标准化

### 4. 数据验证
- 格式验证
- 范围检查
- 异常值检测

## 使用方法

### 去重

```
去除 data.csv 中的重复行
```

### 填充空值

```
用平均值填充 data.csv 的空值
```

### 格式化日期

```
将 data.csv 的日期列统一为 YYYY-MM-DD 格式
```

### 验证数据

```
验证 data.csv 的数据完整性
```

## 技术依赖

- Python 3.8+
- pandas

---

创建：2026-03-11
作者：ClawMart
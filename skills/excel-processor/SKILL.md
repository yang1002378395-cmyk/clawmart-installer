---
name: excel-processor
version: 1.0.0
description: Excel 表格处理 - 读取、编辑、转换 Excel/CSV 文件，数据清洗、公式计算。适合：数据处理、财务、运营。
license: MIT
metadata:
  openclaw:
    emoji: "📊"
    requires:
      bins: ["python3"]
      python: ["pandas", "openpyxl"]
---

# Excel 表格处理 Skill

强大的 Excel/CSV 数据处理能力。

## 核心功能

### 1. 文件操作
- 读取 Excel (.xlsx, .xls)
- 读取 CSV (多种编码)
- 写入/导出多种格式

### 2. 数据处理
- 数据清洗（去重、填充、修正）
- 公式计算
- 数据透视

### 3. 数据转换
- 格式转换
- 列合并/拆分
- 数据类型转换

## 使用方法

### 读取文件

```
读取 data.xlsx 文件，显示前 10 行
```

### 数据清洗

```
清洗这个 Excel，去除重复行，填充空值
```

### 合并表格

```
合并 sales_01.xlsx 和 sales_02.xlsx
```

### 转换格式

```
将 report.xlsx 转换为 CSV 格式
```

## 技术依赖

- Python 3.8+
- pandas
- openpyxl
- xlrd

---

创建：2026-03-11
作者：ClawMart
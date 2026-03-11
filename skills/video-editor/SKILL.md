---
name: video-editor
version: 1.0.0
description: 视频处理工具 - 剪辑、压缩、格式转换、添加字幕。适合：内容创作者、视频剪辑。
license: MIT
metadata:
  openclaw:
    emoji: "🎬"
    requires:
      bins: ["ffmpeg"]
---

# 视频处理工具 Skill

强大的视频处理能力。

## 核心功能

### 1. 基础剪辑
- 裁剪视频片段
- 合并多个视频
- 提取音频

### 2. 格式转换
- MP4 ↔ MOV ↔ AVI ↔ WEBM
- 分辨率调整
- 帧率调整

### 3. 视频优化
- 压缩视频
- 去除噪音
- 画质增强

### 4. 特效处理
- 添加字幕
- 添加水印
- 添加背景音乐

## 使用方法

### 剪辑视频

```
裁剪 video.mp4 从 10 秒到 30 秒
```

### 格式转换

```
将 video.mov 转换为 MP4 格式
```

### 压缩视频

```
压缩 video.mp4 到 50MB 以内
```

### 添加字幕

```
给 video.mp4 添加字幕文件 subtitle.srt
```

## 技术依赖

- FFmpeg

---

创建：2026-03-11
作者：ClawMart
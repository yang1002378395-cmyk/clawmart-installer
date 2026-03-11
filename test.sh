#!/bin/bash
# ClawMart 安装测试脚本
# 在虚拟机或干净环境中测试安装

echo "🧪 ClawMart 安装测试"
echo "====================="
echo ""

# 切换到脚本所在目录
cd "$(dirname "$0")"

# 1. 检查文件完整性
echo "1️⃣ 检查文件完整性..."
if [ ! -f "install.sh" ]; then
    echo "❌ 缺少 install.sh"
    exit 1
fi
echo "  ✅ install.sh"

if [ ! -d "skills" ]; then
    echo "❌ 缺少 skills 目录"
    exit 1
fi

SKILL_COUNT=$(ls -d skills/*/ 2>/dev/null | wc -l | tr -d ' ')
echo "  ✅ skills/ ($SKILL_COUNT 个)"

# 2. 检查每个 Skill 的 SKILL.md
echo ""
echo "2️⃣ 检查 Skills 完整性..."
MISSING=0
for skill_dir in skills/*/; do
    skill_name=$(basename "$skill_dir")
    if [ -f "$skill_dir/SKILL.md" ]; then
        echo "  ✅ $skill_name"
    else
        echo "  ❌ $skill_name (缺少 SKILL.md)"
        MISSING=$((MISSING + 1))
    fi
done

if [ $MISSING -gt 0 ]; then
    echo ""
    echo "⚠️  有 $MISSING 个 Skill 缺少 SKILL.md"
fi

# 3. 模拟安装测试
echo ""
echo "3️⃣ 模拟安装测试..."
echo "  检查依赖..."

# 检查必要的命令
COMMANDS=("python3" "node" "brew")
for cmd in "${COMMANDS[@]}"; do
    if command -v $cmd &> /dev/null; then
        echo "  ✅ $cmd"
    else
        echo "  ⚠️  $cmd 未安装（将在安装时自动安装）"
    fi
done

# 4. 测试 Python 依赖
echo ""
echo "4️⃣ 测试 Python 依赖..."
PYTHON_DEPS=("pandas" "Pillow" "PyPDF2" "requests" "bs4")
for dep in "${PYTHON_DEPS[@]}"; do
    if python3 -c "import $dep" 2>/dev/null; then
        echo "  ✅ $dep"
    else
        echo "  ⚠️  $dep 未安装（将在安装时自动安装）"
    fi
done

# 5. 总结
echo ""
echo "📊 测试总结"
echo "============"
echo "  Skills 数量: $SKILL_COUNT"
echo "  缺失文件: $MISSING"
echo ""

if [ $MISSING -eq 0 ]; then
    echo "✅ 所有检查通过！可以发布。"
    echo ""
    echo "🚀 发布步骤："
    echo "  1. git add ."
    echo "  2. git commit -m 'Add more mainstream skills'"
    echo "  3. git push"
    echo "  4. gh release create v1.1.0 --title 'v1.1.0 - 更多实用 Skills'"
else
    echo "❌ 有问题需要修复"
    exit 1
fi
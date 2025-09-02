#!/bin/bash

# Abstraxion React 开发服务器启动脚本
# 这个脚本帮助启动React开发服务器供Flutter应用连接

echo "🚀 Starting Abstraxion React Development Server..."

# 检查Node.js是否安装
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    echo "   Visit: https://nodejs.org/"
    exit 1
fi

# 检查npm是否可用
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not available. Please install npm."
    exit 1
fi

echo "✅ Node.js version: $(node --version)"
echo "✅ npm version: $(npm --version)"

# 进入React应用目录
REACT_DIR="abstraxion-web"
if [ ! -d "$REACT_DIR" ]; then
    echo "❌ React application directory '$REACT_DIR' not found."
    echo "   Please ensure you're running this script from the Flutter project root."
    exit 1
fi

echo "📁 Entering React application directory: $REACT_DIR"
cd "$REACT_DIR"

# 检查package.json是否存在
if [ ! -f "package.json" ]; then
    echo "❌ package.json not found in $REACT_DIR"
    echo "   Please ensure this is a valid React/Next.js project."
    exit 1
fi

# 检查是否已安装依赖
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install dependencies."
        exit 1
    fi
else
    echo "✅ Dependencies already installed"
fi

# 检查可用的启动脚本
echo "🔍 Checking available scripts..."
if npm run | grep -q "dev"; then
    START_SCRIPT="dev"
elif npm run | grep -q "start"; then
    START_SCRIPT="start"
else
    echo "❌ No suitable start script found (dev or start)."
    echo "   Available scripts:"
    npm run
    exit 1
fi

echo "✅ Found start script: $START_SCRIPT"

# 设置环境变量
export NODE_ENV=development
export PORT=3000
export NEXT_PUBLIC_FLUTTER_MODE=true

echo "🌟 Environment configured:"
echo "   NODE_ENV=$NODE_ENV"
echo "   PORT=$PORT"
echo "   NEXT_PUBLIC_FLUTTER_MODE=$NEXT_PUBLIC_FLUTTER_MODE"

echo ""
echo "🚀 Starting React development server..."
echo "   Server will be available at: http://localhost:$PORT"
echo "   Press Ctrl+C to stop the server"
echo ""

# 启动开发服务器
npm run $START_SCRIPT

echo ""
echo "👋 React development server stopped."

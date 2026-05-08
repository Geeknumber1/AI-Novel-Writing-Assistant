@echo off
chcp 65001 >nul
echo ========================================
echo    AI 小说写作助手 - 启动中...
echo ========================================
echo.

cd /d "%~dp0"

echo [1/3] 检查依赖...
if not exist "node_modules" (
    echo 首次运行，正在安装依赖...
    call pnpm install
    if errorlevel 1 (
        echo.
        echo ❌ 依赖安装失败！
        echo 请确保已安装 Node.js 和 pnpm
        echo.
        echo 安装 pnpm: npm install -g pnpm
        pause
        exit /b 1
    )
)

echo [2/3] 启动数据库迁移...
call pnpm db:migrate

echo [3/3] 启动前后端服务...
echo.
echo ✅ 服务启动中，请稍候...
echo.
echo 📝 前端地址: http://localhost:5173
echo 🔧 后端地址: http://localhost:3000
echo.
echo 按 Ctrl+C 可停止服务
echo ========================================
echo.

call pnpm dev

pause

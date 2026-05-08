# AI 小说写作助手 - 启动脚本
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   AI 小说写作助手 - 启动中..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Set-Location $PSScriptRoot

Write-Host "[1/3] 检查依赖..." -ForegroundColor Yellow
if (-not (Test-Path "node_modules")) {
    Write-Host "首次运行，正在安装依赖..." -ForegroundColor Yellow
    pnpm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host ""
        Write-Host "❌ 依赖安装失败！" -ForegroundColor Red
        Write-Host "请确保已安装 Node.js 和 pnpm" -ForegroundColor Red
        Write-Host ""
        Write-Host "安装 pnpm: npm install -g pnpm" -ForegroundColor Yellow
        Read-Host "按回车键退出"
        exit 1
    }
}

Write-Host "[2/3] 启动数据库迁移..." -ForegroundColor Yellow
pnpm db:migrate

Write-Host "[3/3] 启动前后端服务..." -ForegroundColor Yellow
Write-Host ""
Write-Host "✅ 服务启动中，请稍候..." -ForegroundColor Green
Write-Host ""
Write-Host "📝 前端地址: http://localhost:5173" -ForegroundColor Cyan
Write-Host "🔧 后端地址: http://localhost:3000" -ForegroundColor Cyan
Write-Host ""
Write-Host "按 Ctrl+C 可停止服务" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

pnpm dev

Read-Host "按回车键退出"

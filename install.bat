@echo off
REM Laravel + React E-Commerce Project Installation Script for Windows

echo Installing Laravel + React E-Commerce Project Dependencies...

REM Check if Composer is installed
composer --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Composer is not installed. Please install Composer first.
    pause
    exit /b 1
)

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Node.js is not installed. Please install Node.js first.
    pause
    exit /b 1
)

REM Check if NPM is installed
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo NPM is not installed. Please install NPM first.
    pause
    exit /b 1
)

REM Install PHP dependencies
echo Installing PHP dependencies...
composer install

REM Install Node.js dependencies
echo Installing Node.js dependencies...
npm install

REM Copy environment file if it doesn't exist
if not exist .env (
    echo Copying .env.example to .env...
    copy .env.example .env
)

REM Generate application key
echo Generating application key...
php artisan key:generate

echo Dependencies installed successfully!
echo Next steps:
echo 1. Configure your .env file
echo 2. Run database migrations: php artisan migrate
echo 3. Build frontend assets: npm run dev or npm run build
pause
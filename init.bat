@echo off
REM Laravel + React E-Commerce Project Initialization Script for Windows

echo Initializing Laravel + React E-Commerce Project...

REM Check if Docker is installed
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Docker is not installed. Please install Docker first.
    pause
    exit /b 1
)

REM Check if Docker Compose is installed
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Docker Compose is not installed. Please install Docker Compose first.
    pause
    exit /b 1
)

REM Copy environment file if it doesn't exist
if not exist .env (
    echo Copying .env.example to .env...
    copy .env.example .env
)

REM Start Docker containers
echo Starting Docker containers...
docker-compose up -d

REM Wait for containers to be ready
echo Waiting for containers to be ready...
timeout /t 10 /nobreak >nul

REM Install PHP dependencies
echo Installing PHP dependencies...
docker-compose exec app composer install

REM Generate application key
echo Generating application key...
docker-compose exec app php artisan key:generate

REM Run database migrations
echo Running database migrations...
docker-compose exec app php artisan migrate

REM Install Node dependencies
echo Installing Node dependencies...
docker-compose exec app npm install

REM Build frontend assets
echo Building frontend assets...
docker-compose exec app npm run build

echo Project initialization complete!
echo The application is now available at http://localhost:8000
pause
# Docker Setup for Laravel + React E-Commerce

This document provides instructions for setting up and running the Laravel + React e-commerce application using Docker.

## Prerequisites

- Docker Engine 20.10+ installed
- Docker Compose 1.29+ installed

## Development Setup

### 1. Clone the Repository

```bash
git clone <repository-url>
cd e-commerce
```

### 2. Environment Configuration

Copy the example environment file and adjust as needed:

```bash
cp .env.example .env
```

Update the database configuration in the `.env` file:

```env
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=ecommerce
DB_USERNAME=ecommerce_user
DB_PASSWORD=ecommerce_password
```

### 3. Start the Development Environment

```bash
docker-compose up -d
```

This will start the following services:
- `app`: PHP-FPM application server
- `nginx`: Web server
- `db`: MySQL database
- `redis`: Redis cache
- `node`: Node.js development server for frontend assets

### 4. Install Dependencies and Setup

Enter the app container to run initial setup commands:

```bash
docker-compose exec app composer install
docker-compose exec app php artisan key:generate
docker-compose exec app php artisan migrate --seed
```

### 5. Access the Application

The application will be available at: http://localhost:8000

The frontend development server with hot reloading is available at: http://localhost:5173

## Production Setup

### 1. Environment Configuration

For production, use the production environment file:

```bash
cp .env.example .env
```

Update with production values:

```env
APP_ENV=production
APP_DEBUG=false
APP_URL=https://yourdomain.com

DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=ecommerce
DB_USERNAME=ecommerce_user
DB_PASSWORD=your_secure_password
```

### 2. SSL Configuration

Place your SSL certificates in `docker/nginx/ssl/`:
- `cert.pem` - Certificate file
- `key.pem` - Private key file

### 3. Start the Production Environment

```bash
docker-compose -f docker-compose.prod.yml up -d
```

### 4. Install Dependencies and Setup

```bash
docker-compose -f docker-compose.prod.yml exec app composer install --no-dev
docker-compose -f docker-compose.prod.yml exec app php artisan key:generate
docker-compose -f docker-compose.prod.yml exec app php artisan migrate --force
docker-compose -f docker-compose.prod.yml exec app php artisan config:cache
docker-compose -f docker-compose.prod.yml exec app php artisan route:cache
docker-compose -f docker-compose.prod.yml exec app php artisan view:cache
```

## Useful Docker Commands

### View Logs

```bash
# View all logs
docker-compose logs

# View specific service logs
docker-compose logs app
docker-compose logs nginx
```

### Execute Commands in Containers

```bash
# Enter the app container
docker-compose exec app bash

# Run Artisan commands
docker-compose exec app php artisan list

# Run tests
docker-compose exec app ./vendor/bin/pest
```

### Stop Services

```bash
# Stop all services
docker-compose down

# Stop services and remove volumes
docker-compose down -v
```

## Services Overview

| Service | Port | Description |
|---------|------|-------------|
| nginx | 8000 (dev) / 80,443 (prod) | Web server |
| app | 9000 | PHP-FPM application server |
| db | 3306 | MySQL database |
| redis | 6379 | Redis cache |
| node | 5173 | Frontend development server |

## Troubleshooting

### Common Issues

1. **Permission Issues**: Ensure proper file permissions on mounted volumes
2. **Database Connection**: Verify database credentials in `.env` file
3. **Port Conflicts**: Ensure ports 8000, 3306, 6379 are not in use

### Clear Cache

```bash
docker-compose exec app php artisan cache:clear
docker-compose exec app php artisan config:clear
docker-compose exec app php artisan route:clear
docker-compose exec app php artisan view:clear
```
#!/bin/bash

# Laravel + React E-Commerce Project Initialization Script

echo "Initializing Laravel + React E-Commerce Project..."

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null
then
    echo "Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Copy environment file if it doesn't exist
if [ ! -f .env ]; then
    echo "Copying .env.example to .env..."
    cp .env.example .env
fi

# Start Docker containers
echo "Starting Docker containers..."
docker-compose up -d

# Wait for containers to be ready
echo "Waiting for containers to be ready..."
sleep 10

# Install PHP dependencies
echo "Installing PHP dependencies..."
docker-compose exec app composer install

# Generate application key
echo "Generating application key..."
docker-compose exec app php artisan key:generate

# Run database migrations
echo "Running database migrations..."
docker-compose exec app php artisan migrate

# Install Node dependencies
echo "Installing Node dependencies..."
docker-compose exec app npm install

# Build frontend assets
echo "Building frontend assets..."
docker-compose exec app npm run build

echo "Project initialization complete!"
echo "The application is now available at http://localhost:8000"
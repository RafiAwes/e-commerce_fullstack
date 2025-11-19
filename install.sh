#!/bin/bash

# Laravel + React E-Commerce Project Installation Script

echo "Installing Laravel + React E-Commerce Project Dependencies..."

# Check if Composer is installed
if ! command -v composer &> /dev/null
then
    echo "Composer is not installed. Please install Composer first."
    exit 1
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null
then
    echo "Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if NPM is installed
if ! command -v npm &> /dev/null
then
    echo "NPM is not installed. Please install NPM first."
    exit 1
fi

# Install PHP dependencies
echo "Installing PHP dependencies..."
composer install

# Install Node.js dependencies
echo "Installing Node.js dependencies..."
npm install

# Copy environment file if it doesn't exist
if [ ! -f .env ]; then
    echo "Copying .env.example to .env..."
    cp .env.example .env
fi

# Generate application key
echo "Generating application key..."
php artisan key:generate

echo "Dependencies installed successfully!"
echo "Next steps:"
echo "1. Configure your .env file"
echo "2. Run database migrations: php artisan migrate"
echo "3. Build frontend assets: npm run dev or npm run build"
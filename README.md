# Laravel + React Starter Kit

## Introduction

Our React starter kit provides a robust, modern starting point for building Laravel applications with a React frontend using [Inertia](https://inertiajs.com).

Inertia allows you to build modern, single-page React applications using classic server-side routing and controllers. This lets you enjoy the frontend power of React combined with the incredible backend productivity of Laravel and lightning-fast Vite compilation.

This React starter kit utilizes React 19, TypeScript, Tailwind, and the [shadcn/ui](https://ui.shadcn.com) and [radix-ui](https://www.radix-ui.com) component libraries.

## Official Documentation

Documentation for all Laravel starter kits can be found on the [Laravel website](https://laravel.com/docs/starter-kits).

## Getting Started

### Prerequisites

- PHP >= 8.2
- Composer >= 2.x
- Node.js >= 22.x
- NPM >= 10.x
- SQLite (for development) or MySQL 8.0+/PostgreSQL 10+

### Quick Installation

For a quick setup, you can use the provided installation scripts:
- On Unix/Linux/macOS: Run `./install.sh`
- On Windows: Run `install.bat`

### Manual Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd e-commerce
   ```

2. Install PHP dependencies:
   ```bash
   composer install
   ```

3. Install Node dependencies:
   ```bash
   npm install
   ```

4. Copy and configure the environment file:
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```

5. Run database migrations:
   ```bash
   php artisan migrate
   ```

6. Build frontend assets:
   ```bash
   npm run build
   ```

### Development

Start the development server with hot reload:
```bash
npm run dev
```

Or use the combined development command:
```bash
composer run dev
```

## Docker Setup

This project includes Docker configuration for both development and production environments.

### Development with Docker

1. Start the Docker environment:
   ```bash
   docker-compose up -d
   ```

2. Install dependencies and setup:
   ```bash
   docker-compose exec app composer install
   docker-compose exec app php artisan key:generate
   docker-compose exec app php artisan migrate
   ```

The application will be available at http://localhost:8000

For detailed Docker instructions, see [DOCKER.md](DOCKER.md).

## Testing

Run PHP tests:
```bash
composer test
```

Run browser tests:
```bash
./vendor/bin/pest --testsuite=browser
```

## Code Quality

Lint PHP code:
```bash
./vendor/bin/pint
```

Lint JavaScript/TypeScript code:
```bash
npm run lint
```

Format code:
```bash
npm run format
```

Check TypeScript types:
```bash
npm run types
```

## Contributing

Thank you for considering contributing to our starter kit! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## License

The Laravel + React starter kit is open-sourced software licensed under the MIT license.
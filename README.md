# 🚀 Angular NGX Env Builder with Runtime Configuration

[![Angular](https://img.shields.io/badge/Angular-19.2.0-DD0031?logo=angular&logoColor=white)](https://angular.io/)
[![NGX-ENV](https://img.shields.io/badge/NGX_ENV-19.0.4-8a2be2)](https://github.com/chihab/ngx-env)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## 📋 Overview

This project demonstrates how to use `@ngx-env/builder` with runtime configuration enabled in an Angular 19 application. The runtime option allows environment variables to be modified after the application is built, making it ideal for containerized deployments.

## ✨ Features

- 🔄 **Runtime Environment Variables** - Change env vars without rebuilding using envsubst
- 🐳 **Docker Integration** - Ready for containerized deployments with environment variable support
- 🌐 **Nginx Configuration** - Optimized for SPA with proper caching controls
- 🧩 **Environment Typing** - Fully typed environment variables with safe access helpers
- 📦 **Latest Angular** - Built with Angular 19
- 🛡️ **Safe Environment Access** - Helper function for safe environment variable access with fallbacks

## 🛠️ Technical Details

### Environment Configuration

The project uses `@ngx-env/builder` with runtime mode enabled in the Angular configuration:

```json
"ngxEnv": {
  "prefix": "NG_APP_",
  "runtime": true
}
```

This generates a `ngx-env.js` file at build time that can be replaced at runtime.

### Environment Variables

The following environment variables are configured:

| Variable | Description | Example |
|----------|-------------|---------|
| `NG_APP_ENV` | Current environment | `development`, `production` |
| `NG_APP_API_URL` | API endpoint URL | `https://api.placeholder.test` |
| `NG_APP_FEATURE_FLAG` | Feature toggle | `true`, `false` |

### Docker Setup

The project includes:
- `Dockerfile` for building and serving the application with envsubst for runtime environment generation
- `docker-compose.yml` for easy deployment with environment variable support
- `environment.conf` template file with environment variable placeholders
- Custom `nginx.conf` with proper caching headers for the runtime environment file

## 🚦 Getting Started

### Prerequisites

- Node.js 18+ 
- npm or yarn
- Docker and Docker Compose (optional, for containerized deployment)

### Development

1. Clone the repository
```bash
git clone <repository-url>
cd angular-ngx-env-builder
```

2. Install dependencies
```bash
npm install
```

3. Start the development server
```bash
npm start
```

4. Open your browser to `http://localhost:4200`

### Build for Production

```bash
npm run build
```

### Docker Deployment

1. Ensure your `.env` file contains the required environment variables:
```bash
NG_APP_ENV=production
NG_APP_API_URL=https://api.example.com
NG_APP_FEATURE_FLAG=true
```

2. Build and start the Docker container
```bash
docker-compose up -d
```

3. Access the application at `http://localhost:4200`

4. To update environment variables:
   - Modify the `.env` file
   - Restart the container: `docker-compose restart`
   - The `ngx-env.js` file will be regenerated automatically using `envsubst`

## 🧪 Testing

Run unit tests with:
```bash
npm test
```

## 📝 How Runtime Configuration Works

1. At build time, `@ngx-env/builder` creates a `ngx-env.js` file containing environment variables
2. The Dockerfile fixes the relative path to an absolute path (`/ngx-env.js`) in `index.html`
3. The `environment.conf` template file contains placeholders (e.g., `${NG_APP_ENV}`) for environment variables
4. At container startup, `envsubst` processes the template and generates the final `ngx-env.js` file from environment variables
5. The nginx configuration ensures this file is never cached
6. Environment variables are accessed via the `getEnvValue()` helper function in `src/environments/environment.ts`
7. Changes to environment variables require a container restart to take effect

## 📚 Resources

- [NGX-ENV Documentation](https://github.com/chihab/ngx-env)
- [Angular Documentation](https://angular.dev/)
- [Docker Documentation](https://docs.docker.com/)

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

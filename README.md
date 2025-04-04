# 🚀 Angular NGX Env Builder with Runtime Configuration

[![Angular](https://img.shields.io/badge/Angular-19.2.0-DD0031?logo=angular&logoColor=white)](https://angular.io/)
[![NGX-ENV](https://img.shields.io/badge/NGX_ENV-19.0.4-8a2be2)](https://github.com/chihab/ngx-env)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## 📋 Overview

This project demonstrates how to use `@ngx-env/builder` with runtime configuration enabled in an Angular 19 application. The runtime option allows environment variables to be modified after the application is built, making it ideal for containerized deployments.

## ✨ Features

- 🔄 **Runtime Environment Variables** - Change env vars without rebuilding
- 🐳 **Docker Integration** - Ready for containerized deployments
- 🌐 **Nginx Configuration** - Optimized for SPA with proper caching controls
- 🧩 **Environment Typing** - Fully typed environment variables
- 📦 **Latest Angular** - Built with Angular 19

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
- `Dockerfile` for building and serving the application
- `docker-compose.yml` for easy deployment
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

1. Build and start the Docker container
```bash
docker-compose up -d
```

2. Access the application at `http://localhost:4200`

3. To update environment variables, modify the `config/ngx-env.js` file

## 🧪 Testing

Run unit tests with:
```bash
npm test
```

## 📝 How Runtime Configuration Works

1. At build time, `@ngx-env/builder` creates a `ngx-env.js` file containing environment variables
2. During Docker deployment, this file is volume-mounted from `./config/ngx-env.js`
3. The nginx configuration ensures this file is never cached
4. Changes to `config/ngx-env.js` take effect immediately on page refresh

## 📚 Resources

- [NGX-ENV Documentation](https://github.com/chihab/ngx-env)
- [Angular Documentation](https://angular.dev/)
- [Docker Documentation](https://docs.docker.com/)

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

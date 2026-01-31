# ==================================
# 1) Build stage
# ==================================
FROM node:22-alpine AS builder

WORKDIR /app

# Copy and install dependencies
COPY package*.json ./
RUN npm ci

# Copy the remaining source code
COPY . .

# Build the Angular application in production mode
RUN npm run build

# Fix ngx-env builder's relative path to absolute path
RUN sed -i 's|src="ngx-env.js"|src="/ngx-env.js"|g' /app/dist/angular-ngx-env-builder/browser/index.html

# ==================================
# 2) Runtime stage
# ==================================
FROM nginx:alpine

# Copy built application from stage 1
COPY --from=builder /app/dist/angular-ngx-env-builder/browser /usr/share/nginx/html

# Copy the environment configuration template
COPY ./environment.conf /usr/share/nginx/html/ngx-env.js.template

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# Generate environment file and start nginx
CMD ["/bin/sh", "-c", "envsubst < /usr/share/nginx/html/ngx-env.js.template > /usr/share/nginx/html/ngx-env.js && nginx -g 'daemon off;'"]

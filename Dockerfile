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

# ==================================
# 2) Runtime stage
# ==================================
FROM nginx:alpine

# Copy built application from stage 1
COPY --from=builder /app/dist/angular-ngx-env-builder/browser /usr/share/nginx/html

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

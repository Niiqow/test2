# Base image
FROM node:latest

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app files
COPY . .

# Build app
RUN npm run build

# Install serve for production build
RUN npm install -g serve

# Expose port
EXPOSE 90

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl -f http://localhost:${PORT:-90} || exit 1
  
# Start app
CMD ["serve", "-s", "build"]

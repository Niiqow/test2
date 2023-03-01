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

# Start app
CMD ["serve", "-s", "build"]

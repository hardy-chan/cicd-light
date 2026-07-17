# Official, lightweight Node runtime base image
FROM node:20-alpine

# Working directory inside container
WORKDIR /app

# Copy dependency files first to optimize build caching
COPY package*.json ./

# Install production dependencies
RUN npm ci --only=production

# Copy application source code
COPY . .

# Expose web server port
EXPOSE 3000

# Runtime execution command
CMD ["npm", "start"]

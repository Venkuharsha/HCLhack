FROM node:18-alpine

WORKDIR /app

COPY . .
# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application code
COPY src/ ./src/

# Expose port
EXPOSE 3000

# Start the service
CMD ["npm", "start"]
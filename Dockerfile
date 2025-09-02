# Use Node.js 22.13.0 as specified in package.json
FROM --platform=linux/amd64 node:22.13.0

# Set working directory
WORKDIR /app

# Copy package files first for better layer caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose port 3000 (default for Create React App dev server)
EXPOSE 3000

# Start the development server
CMD ["npm", "start"]
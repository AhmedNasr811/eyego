# Use an official lightweight Node.js image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy the rest of the application files
COPY . .

# Expose port 3000 (or the port your app runs on)
EXPOSE 3000

# Define the command to run the app
CMD ["node", "server.js"]

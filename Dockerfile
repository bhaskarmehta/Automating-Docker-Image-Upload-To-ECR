# We will use a multi-stage build for smaller final image size

# First stage: Installing dependencies and build the application
FROM node:alpine AS build

# Setting the working directory in the container
WORKDIR /src/app

# By default, commands will run as a root user which is not a good practice in terms of security. 
# So to avoid this situation we will run as a non-root user and -D means here we will not use password.
RUN adduser -D Bhaskar

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the application code
COPY . .

# Second stage: Creating a smaller image without unnecessary dependencies
FROM node:alpine

# Setting the working directory in the container
WORKDIR /src/app

# Copying only necessary files from the previous stage
COPY --from=build /src/app/package.json .
COPY --from=build /src/app .

# Installing the dependencies
RUN npm install

# Recreating the Bhaskar user in the second stage
RUN adduser -D Bhaskar

# Exposing the port
EXPOSE 3000

# Running as a Bhaskar User
USER Bhaskar

# Command to start the application
CMD ["node", "index.js"]

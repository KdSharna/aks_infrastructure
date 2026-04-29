# Stage 1: Build the React app
# FROM node:16.17.0-alpine as build
FROM node:18-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the remaining application code
COPY . .

ARG REACT_APP_GET_TASKS_API_BASE_URL
ARG REACT_APP_DELETE_TASK_API_BASE_URL
ARG REACT_APP_CREATE_TASK_API_BASE_URL

# Environment variables for React build
ENV REACT_APP_GET_TASKS_API_BASE_URL=$REACT_APP_GET_TASKS_API_BASE_URL
ENV REACT_APP_DELETE_TASK_API_BASE_URL=$REACT_APP_DELETE_TASK_API_BASE_URL
ENV REACT_APP_CREATE_TASK_API_BASE_URL=$REACT_APP_CREATE_TASK_API_BASE_URL

# Build the React app
RUN npm run build

# Stage 2: Create a minimal production-ready image
FROM nginx:alpine

# Copy the built app from the 'build' stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

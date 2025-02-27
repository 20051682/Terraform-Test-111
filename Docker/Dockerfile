# Use official Nginx image as the base image
FROM nginx:latest

# Copy the HTML file to the Nginx web root directory
COPY app/index.html /usr/share/nginx/html/index.html

# Expose port 80 to allow HTTP traffic
EXPOSE 80

# Start the Nginx web server
CMD ["nginx", "-g", "daemon off;"]

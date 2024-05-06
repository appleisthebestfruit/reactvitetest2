# Start with the official Nginx image
FROM nginx:latest

# Copy custom configuration file into the image
COPY nginx.conf /etc/nginx/nginx.conf

# Set the working directory to Nginx's document root
WORKDIR /usr/share/nginx/html

# Use an official NGINX image
FROM nginx:alpine

# Copy build files to NGINX's default location
COPY dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]

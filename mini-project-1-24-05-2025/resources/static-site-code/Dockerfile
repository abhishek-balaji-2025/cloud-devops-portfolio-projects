FROM ubuntu:latest

# Note: Always use apt-get instead of apt, as it is supportive for Dockerfiles
# update is necessary
RUN apt-get update -y

# Install nginx web-server
RUN apt-get install nginx -y

# Copy static-webpage.html from this path and paste it in /var/www/html/
# Since your Dockerfile and static-webpage.html are in the same directory, simply use a relative path
COPY static-webpage.html /var/www/html/

# open port 80 got HTTP traffic
EXPOSE 80

# Start nginx service
# This will make sure that nginx service will not run in the background
CMD ["nginx", "-g", "daemon off;"]

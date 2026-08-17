# Production Nginx Alpine Container for Render Auto-Deployment
FROM nginx:alpine

# Install gettext for envsubst
RUN apk add --no-cache gettext

# Copy static assets to web root
COPY index.html /usr/share/nginx/html/index.html
COPY styles.css /usr/share/nginx/html/styles.css
COPY projects.json /usr/share/nginx/html/projects.json
COPY portfolio_thumbnail.jpg /usr/share/nginx/html/portfolio_thumbnail.jpg

# Copy Nginx template and entrypoint script
COPY nginx.conf.template /etc/nginx/templates/nginx.conf.template
COPY entrypoint.sh /docker-entrypoint.custom.sh

# Make entrypoint executable
RUN chmod +x /docker-entrypoint.custom.sh

# Default port for Render (Render passes $PORT dynamically)
ENV PORT=80

EXPOSE 80 10000

ENTRYPOINT ["/docker-entrypoint.custom.sh"]
CMD ["nginx", "-g", "daemon off;"]

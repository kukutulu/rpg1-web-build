FROM nginx:1.25-alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Custom config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy WebGL build
COPY Build /usr/share/nginx/html/Build
COPY TemplateData /usr/share/nginx/html/TemplateData
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

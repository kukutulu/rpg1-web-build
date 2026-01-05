FROM fholzer/nginx-brotli:alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/game.conf
COPY WebGLBuild/ /usr/share/nginx/html/

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]

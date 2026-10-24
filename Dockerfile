# Wolfy Wave Index - 纯静态站，用 nginx:alpine 托管
FROM nginx:alpine
COPY . /usr/share/nginx/html
EXPOSE 80

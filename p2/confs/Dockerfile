FROM nginx:latest

# Template
COPY ./template/index.html.template /etc/nginx/templates/index.html
COPY ./template/kubernetes-logo.png /usr/share/nginx/html/kubernetes-logo.png

# Config NGINX
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Command to insert env variables
CMD ["sh", "-c", "envsubst < /etc/nginx/templates/index.html > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"]
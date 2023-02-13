FROM nginx:1.23.3-alpine-slim
RUN rm -rf /var/lib/apt/lists/* && \
    rm /etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
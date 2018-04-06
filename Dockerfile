FROM nginx

RUN rm -rf /etc/nginx/conf.d
ADD conf.d /etc/nginx/conf.d

HEALTHCHECK --interval=15s --timeout=3s CMD curl -f http://localhost/health || exit 1

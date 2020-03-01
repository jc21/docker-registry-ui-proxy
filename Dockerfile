FROM nginx

MAINTAINER Jamie Curnow <jc@jc21.com>
LABEL maintainer="Jamie Curnow <jc@jc21.com>"

RUN rm -rf /etc/nginx/conf.d
ADD conf.d /etc/nginx/conf.d

RUN apt-get update \
    && apt-get install -y curl \
    && apt-get clean

HEALTHCHECK --interval=15s --timeout=3s CMD curl -f http://localhost/health || exit 1

FROM ruby:alpine

RUN set -xe \
  && apk add --no-cache \
    libstdc++ \
    sqlite-libs \
  && apk add --no-cache --virtual .build-deps \
    build-base \
    sqlite-dev \
  && gem install mailcatcher --no-ri --no-rdoc \
  && apk del .build-deps

EXPOSE 1080/tcp
EXPOSE 1025/tcp
CMD mailcatcher --ip=0.0.0.0 --no-quit --foreground

# Dockerfile
# gets the docker parent image
FROM ruby:2.5.5-alpine

ENV BUNDLER_VERSION=2.0.2

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python \
      tzdata \
      yarn

RUN gem update --system
RUN gem install bundler -v 2.0.2
RUN gem install rails

RUN mkdir -p /var/app
COPY rails-on-docker-compose /var/app
WORKDIR /var/app

RUN bundle install

# CMD rails s -b 0.0.0.0
CMD bundle exec rails s -p 3000 -b '0.0.0.0'

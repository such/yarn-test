FROM mhart/alpine-node:10.11.0

RUN apk update && apk upgrade && apk add --no-cache git make gcc g++ bash

ENV YARN_VERSION 1.10.1
ADD https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v${YARN_VERSION}.tar.gz /opt/yarn.tar.gz
RUN yarnDirectory=/opt/yarn && \
  mkdir -p "$yarnDirectory" && \
  tar -xzf /opt/yarn.tar.gz -C "$yarnDirectory" && \
  ln -sf "$yarnDirectory/yarn-v$YARN_VERSION/bin/yarn" /usr/local/bin/ && \
  rm /opt/yarn.tar.gz

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Add entry point to make sure dependencies are up to date.
ENTRYPOINT ["/app/docker-entrypoint.sh"]

EXPOSE 3000

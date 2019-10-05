FROM node:12-stretch-slim
WORKDIR /app/front
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends\
    apt-utils gcc g++ bzip2 make autoconf \
    git python procps \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN yarn install

CMD ["sh", "/front/docker/start.sh"]

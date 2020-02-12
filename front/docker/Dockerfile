FROM node:12-stretch-slim
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends\
    apt-utils gcc g++ bzip2 make autoconf \
    git python procps \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["sh", "docker/start.sh"]

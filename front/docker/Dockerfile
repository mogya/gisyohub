FROM node:12-stretch-slim
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends\
    apt-utils gcc g++ bzip2 make autoconf \
    git python procps curl nano\
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${USER_ID}
ENV HOME /front

CMD ["sh", "docker/start.sh"]

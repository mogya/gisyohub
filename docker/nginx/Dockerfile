FROM nginx
RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y \
    procps less \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY front /front
COPY docker/nginx /nginx
CMD ["/bin/bash", "/nginx/start.sh"]

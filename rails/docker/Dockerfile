FROM ruby:2.6

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl --silent --location https://deb.nodesource.com/setup_12.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# hadolint ignore=DL3008
RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y \
    apt-utils nodejs yarn \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"
ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH
# hadolint ignore=DL3028
RUN gem install bundler \
  && bundle config --global path "$GEM_HOME" \
  && bundle config --global bin "$GEM_HOME/bin"
ENV BUNDLE_APP_CONFIG $GEM_HOME
EXPOSE 3000

WORKDIR /rails/
COPY Gemfile /rails/
COPY Gemfile.lock /rails/
RUN bundle install -j4 && \
    bundle clean

# main process.
CMD ["sh", "/rails/docker/start.sh"]

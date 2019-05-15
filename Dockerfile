FROM alpine:3.9

LABEL maintainer="Beth Skurrie <beth@bethesque.com>"

ENV NOKOGIRI_USE_SYSTEM_LIBRARIES=1
ENV BUNDLE_SILENCE_ROOT_WARNING=1

ADD docker/gemrc /root/.gemrc

# Update from rubygems 2.7.6 to 3.0.3 for security reasons
# Verify with gem -v
# TODO: Remove this when it is no longer needed
# For some reason this line changes the image size from 60 to 80 MB?!?

RUN apk update \
  && apk add ruby \
             ruby-bigdecimal \
             ruby-bundler \
             ruby-io-console \
             ca-certificates \
             libressl \
             less \
  && apk add --virtual build-dependencies \
             build-base \
             ruby-dev \
             libressl-dev \
             ruby-rdoc \
  \
  && bundle config build.nokogiri --use-system-libraries \
  && bundle config git.allow_insecure true \
  && gem update --system \
  && gem install json \
  && gem cleanup \
  && apk del build-dependencies \
  && rm -rf /usr/lib/ruby/gems/*/cache/* \
            /var/cache/apk/* \
            /tmp/* \
            /var/tmp/*

ENV HOME /pact
ENV DOCKER true
WORKDIR $HOME

ADD pact-cli.gemspec .
ADD Gemfile .
ADD Gemfile.lock .
ADD lib/pact/cli/version.rb ./lib/pact/cli/version.rb
RUN bundle install --without test development
ADD docker/entrypoint.sh $HOME/entrypoint.sh
ADD bin ./bin
ADD lib ./lib
ADD example/pacts ./example/pacts

ENTRYPOINT ["/pact/entrypoint.sh"]

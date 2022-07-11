FROM alpine:3.15

LABEL maintainer="Beth Skurrie <beth@bethesque.com>"

ENV NOKOGIRI_USE_SYSTEM_LIBRARIES=1
ENV BUNDLE_SILENCE_ROOT_WARNING=1

ADD docker/gemrc /root/.gemrc
ADD docker/pact /usr/local/bin/pact

RUN apk update \
  && apk add "ruby=3.0.4-r0" \
             "ruby-bigdecimal=3.0.4-r0" \
             "ruby-bundler=2.2.33-r0" \
             "ruby-io-console=3.0.4-r0" \
             "ca-certificates=20211220-r0" \
             "libressl" \
             "less" \
             "git" \
  && apk add --virtual "build-dependencies" \
             build-base=0.5-r3 \
             ruby-dev=3.0.4-r0 \
             libressl-dev \
             ruby-rdoc=3.0.4-r0 \
  \
  && bundler -v \
  && bundle config build.nokogiri --use-system-libraries \
  && bundle config git.allow_insecure true \
  && gem update --system \
  && gem install json -v "~>2.3" \
  && gem cleanup \
  && apk del build-dependencies \
  && rm -rf /usr/lib/ruby/gems/*/cache/* \
            /var/cache/apk/* \
            /tmp/* \
            /var/tmp/*

ENV HOME /pact
ENV DOCKER true
ENV BUNDLE_GEMFILE=$HOME/Gemfile
WORKDIR $HOME

ADD pact-cli.gemspec .
ADD Gemfile .
ADD Gemfile.lock .
ADD lib/pact/cli/version.rb ./lib/pact/cli/version.rb
RUN bundle config set without 'test development' \
    bundle config set deployment 'true' \
      && bundle install \
      && find /usr/lib/ruby/gems/3.0.0/gems -name Gemfile.lock -maxdepth 2 -delete
ADD docker/entrypoint.sh $HOME/entrypoint.sh
ADD bin ./bin
ADD lib ./lib
ADD example/pacts ./example/pacts

ENTRYPOINT ["/pact/entrypoint.sh"]
CMD ["pact"]

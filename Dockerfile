FROM alpine:3.22.0

LABEL maintainer="Beth Skurrie <beth@bethesque.com>"

ENV NOKOGIRI_USE_SYSTEM_LIBRARIES=1
ENV BUNDLE_SILENCE_ROOT_WARNING=1

ADD docker/gemrc /root/.gemrc
ADD docker/pact /usr/local/bin/pact

RUN apk update \
  && apk add ruby=3.4.4-r0 \
             ca-certificates=20250619-r0 \
             libressl \
             less \
             git \
  && apk add --virtual "build-dependencies" \
             build-base=0.5-r3 \
             ruby-dev=3.4.4-r0 \
             libressl-dev \
             ruby-rdoc=3.4.4-r0 \
  && gem install bundler -v "~>2.6" \
  && bundler -v \
  && bundle config build.nokogiri --use-system-libraries \
  && bundle config git.allow_insecure true \
  && gem update --system 3.6.9 \
  && gem install json -v "~>2.13" \
  && gem install bigdecimal -v "~>3.2" \
  && gem install racc -v "~>1.8" \
  && gem uninstall rubygems-update \
  && gem cleanup \
  && apk del build-dependencies \
  && rm -rf /usr/lib/ruby/gems/*/cache/* \
            /var/cache/apk/* \
            /tmp/* \
            /var/tmp/*

ENV HOME=/pact
ENV DOCKER=true
ENV BUNDLE_GEMFILE=$HOME/Gemfile
WORKDIR $HOME

ADD pact-cli.gemspec .
ADD Gemfile .
ADD Gemfile.lock .
ADD lib/pact/cli/version.rb ./lib/pact/cli/version.rb
RUN bundle config set without 'test development' \
    bundle config set deployment 'true' \
      && bundle install \
      && find /usr/lib/ruby/gems/3.4.0/gems -name Gemfile.lock -maxdepth 2 -delete
RUN apk add curl && \
  curl https://download.pactflow.io/ai/get.sh -o /tmp/get.sh && \
  chmod +x /tmp/get.sh && \
  sed -i '493s/^/echo ""/' /tmp/get.sh && \
  /tmp/get.sh -y \
  && apk del curl
ENV PATH="/pact/.local/bin:$PATH"
ADD docker/entrypoint.sh $HOME/entrypoint.sh
ADD bin ./bin
ADD lib ./lib
ADD example/pacts ./example/pacts
ADD example/provider-contracts ./example/provider-contracts

ENTRYPOINT ["/pact/entrypoint.sh"]
CMD ["pact"]

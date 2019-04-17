# Copied with thanks from https://github.com/DannyBen/docker-alpine-ruby

FROM alpine:3.9

ENV BUILD_PACKAGES bash curl curl-dev ruby-dev build-base
ENV RUBY_PACKAGES \
  ruby ruby-io-console ruby-irb \
  ruby-json ruby-etc ruby-bigdecimal ruby-rdoc \
  libffi-dev zlib-dev
ENV TERM=linux
ENV PS1 "\n\n>> ruby \W \$ "

RUN apk --no-cache add $BUILD_PACKAGES $RUBY_PACKAGES

RUN echo 'gem: --no-document' > /etc/gemrc && \
    gem install bundler

# Update from rubygems 2.7.6 to 3.0.3 for security reasons
# Verify with gem -v
# TODO: Remove this when it is no longer needed
RUN gem update --system

RUN bundle config --global silence_root_warning 1

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

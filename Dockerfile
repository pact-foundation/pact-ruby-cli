FROM ruby:2.4-alpine

RUN apk add --no-cache --update git alpine-sdk
ENV HOME /app
WORKDIR $HOME

ADD pact-cli.gemspec .
ADD Gemfile .
ADD Gemfile.lock .
ADD lib/pact/cli/version.rb ./lib/pact/cli/version.rb
RUN bundle install --without test development
ADD docker/entrypoint.sh $HOME/entrypoint.sh
ADD bin ./bin
ADD lib ./lib

ENTRYPOINT ["/app/entrypoint.sh"]

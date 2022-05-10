source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in pact-cli.gemspec
gemspec

if ENV["X_PACT_DEVELOPMENT"] == "true"
  gem "pact_broker-client", path: "../pact_broker-client"
end

group :development do
  gem "pry"
  gem 'conventional-changelog', '~> 1.3', git: 'https://github.com/bethesque/conventional-changelog-ruby.git', ref: '303b4277a64371d01e43754dfd5f47eee42ccd79'
  gem 'bump', '~> 0.5'
end

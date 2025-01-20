ARG RUBY_VERSION=3.3.5
FROM docker.io/library/ruby:$RUBY_VERSION-slim
ENV ROOT="/app"

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  vim

WORKDIR ${ROOT}

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}
ENV PATH="/app/venv/bin:$PATH"
RUN gem install bundler
RUN bundle install
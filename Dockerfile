FROM ruby:2.7.2
RUN apt-get update && apt-get install -y --no-install-recommends build-essential libpq-dev nodejs \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:2.0.2 && bundle install
COPY . /myapp

FROM ruby:2.7.1
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:2.0.2 && bundle install
COPY . /myapp

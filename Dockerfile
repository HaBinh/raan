FROM ruby:2.4.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /raan
WORKDIR /raan
ADD Gemfile /raan/Gemfile
ADD Gemfile.lock /raan/Gemfile.lock
RUN bundle install
ADD . /raan
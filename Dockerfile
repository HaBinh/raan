FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD . /myapp
RUN bundle install
EXPOSE 3000
CMD ["RAILS_ENV=production","rails","s"]
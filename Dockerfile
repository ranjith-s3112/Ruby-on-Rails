FROM ruby:3.2.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /myapp

RUN gem install bundler -v 2.5.6

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle _2.5.6_ install

COPY . /myapp

EXPOSE 4500

CMD ["rails", "server", "-b", "0.0.0.0"]

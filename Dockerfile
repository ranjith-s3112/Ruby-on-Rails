FROM ruby:3..3.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set up working directory
WORKDIR /myapp

# Install Gems
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Copy the application code
COPY . /myapp

# Expose the port on which the app will run
EXPOSE 4500

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]

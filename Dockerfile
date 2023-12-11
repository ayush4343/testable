# # Use the official Ruby image
# FROM ruby:3.0.0

# # Set working directory
# WORKDIR /usr/src/app

# # Install dependencies
# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# # Install gems
# COPY Gemfile Gemfile.lock ./
# RUN gem install bundler && bundle install

# # Copy the rest of the application code
# COPY . .

# EXPOSE 3000
# # Start the Rails server
# CMD rm -f tmp/pids/server.pid && rails s -b '0.0.0.0' 
# Use an official Ruby runtime as a parent image
FROM ruby:3.0.0
# Set the working directory
WORKDIR /app
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    nodejs \
    postgresql-client
# Install gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && \
    bundle install --jobs 4
# Copy the application code
COPY . .
# Expose ports
EXPOSE 3000
# Set the entrypoint command
CMD ["rails", "server", "-b", "0.0.0.0"]

FROM ruby:2.5.1
# Install dependencies
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev imagemagick 
# Set path
ENV INSTALL_PATH /pomodoroClone
# Create directory
RUN mkdir -p $INSTALL_PATH
# Set path with main directory
WORKDIR $INSTALL_PATH
# Copy Gemfile to inside container
COPY Gemfile ./
# Set path to Gems
ENV BUNDLE_PATH /box
# Copy code to inside container
COPY . .
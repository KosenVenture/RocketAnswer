FROM ruby:2.4

ARG app_env
ENV APP_ENV ${app_env:-production}
ENV RAILS_ENV $APP_ENV

ENV APP_HOME /usr/local/rocket_answer
WORKDIR $APP_HOME

# Install gems
# COPY vendor/bundle vendor/bundle
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY scripts/bundle_install.sh scripts/bundle_install.sh
RUN /bin/sh scripts/bundle_install.sh

# Prepare App
COPY . $APP_HOME

# Remove Cache
# RUN rm -rf vendor/bundle/ruby/*/cache
# RUN bundle clean

## Expose assets for web container
VOLUME $APP_HOME/public/assets

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
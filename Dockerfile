FROM phusion/passenger-ruby25
# Set correct environment variables.
ENV HOME /root
ENV APP_HOME /home/app/webapp

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# Install imagemagic
RUN apt-get update -yq

# use port 80
EXPOSE 80

# Should start nginx.
COPY docker_config/nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /etc/service/nginx/down

# Nginx configs
RUN rm /etc/nginx/sites-enabled/default
ADD docker_config/webapp.conf /etc/nginx/sites-enabled/webapp.conf

# App installation
WORKDIR /tmp/
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME
# RUN cp /tmp/.bundle $APP_HOME/ -r
ADD docker_config/env $APP_HOME/.env


# The following are to be done only in the machine running the app.
#RUN RAILS_ENV=production bundle exec rake db:create
RUN RAILS_ENV=production bundle exec rake db:migrate
RUN RAILS_ENV=production bundle exec rake assets:precompile

# first creation only

RUN chown -R app:app $APP_HOME

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

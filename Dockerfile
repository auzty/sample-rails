FROM phusion/passenger-ruby33

RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default

ADD nginx/webapp.conf /etc/nginx/sites-enabled/webapp.conf

RUN mkdir /home/app/webapp

COPY --chown=app:app . /home/app/webapp

WORKDIR /home/app/webapp

RUN bash -lc 'rvm --default use ruby-3.3.3'
RUN rvm-exec 3.3.3 bundle install
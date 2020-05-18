FROM ruby:2.6.5

WORKDIR /home/app

ENV PORT 3000

EXPOSE $PORT

# RUN gem install rails bundler
RUN gem install rails -v 6.0.2
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

RUN apt-get update -qq && apt-get install -y nano
RUN gem install bundler

ENTRYPOINT [ "/bin/bash" ]


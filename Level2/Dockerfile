FROM ruby:3.0.0-alpine
# FROM ruby:3.0.1-alpine3.13

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

RUN bundle

CMD ["ruby", "temperature.rb"]
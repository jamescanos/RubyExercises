FROM ruby:3.0.0-alpine
# FROM ruby:3.0.1-alpine3.13

RUN mkdir -p /testapp
WORKDIR /testapp
ADD Gemfile /testapp/Gemfile
ADD Gemfile.lock /testapp/Gemfile.lock
ADD lib/similarity.rb /testapp/lib/similarity.rb

COPY . /testapp

RUN bundle
ADD . /testapp
RUN gem install --local /testapp/similarity-0.0.0.gem 

CMD ["rake", "rakefile"]
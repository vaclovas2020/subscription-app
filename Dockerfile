FROM ruby:2.7.0
WORKDIR /ruby
ADD ./best-subscription-app ./app
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN cd app
RUN bundle install
RUN rails install
RUN rails generate shopify_app
RUN bundle install
RUN rails generate graphql:install
RUN bundle install
RUN rails db:migrate
RUN rails webpacker:install
RUN rails webpacker:install:react
RUN rails generate react:install
ENTRYPOINT ["rails", "server", "-b", "subscription_app"]
EXPOSE 3000
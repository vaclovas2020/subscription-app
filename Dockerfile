FROM ruby:2.7.0
WORKDIR /ruby/app
ADD ./best-subscription-app ./
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client npm 
RUN npm install -g yarn
RUN bundle install
RUN rails assets:precompile
ENTRYPOINT ["rails", "server", "-b", "0.0.0.0", "-e", "development"]
EXPOSE 3000
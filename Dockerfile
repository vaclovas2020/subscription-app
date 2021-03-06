FROM ruby:2.7.0
WORKDIR /ruby/app
ADD ./best-subscription-app ./
RUN apt-get update -qq && apt-get install -y postgresql-client npm 
RUN npm install -g yarn
RUN yarn install
RUN bundle install
RUN rails assets:precompile
RUN rails db:migrate
ENTRYPOINT ["rails", "server", "-b", "0.0.0.0", "-e", "development"]
EXPOSE 3000
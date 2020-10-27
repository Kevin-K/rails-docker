FROM ruby:2.7-alpine

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache \
    bash build-base postgresql-dev tzdata \
    nodejs yarn

RUN gem install bundler:2.1.4

WORKDIR /usr/src/app

COPY Gemfile* ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install --check-files

COPY . .

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
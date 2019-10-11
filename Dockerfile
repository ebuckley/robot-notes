FROM ruby:2.6.3
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
# RUN rails assets:precompile
COPY docker-entrypoint.sh /usr/bin
ENTRYPOINT [ "docker-entrypoint.sh" ]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

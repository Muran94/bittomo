FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y vim nodejs postgresql-client yarn


# Install node.js and yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get install -y nodejs
RUN apt-get update && apt-get install -y yarn


# Create app directory and set as your workdir.
ARG APP_DIR="/bittomo"
RUN mkdir $APP_DIR
WORKDIR $APP_DIR


# Bundle install
COPY Gemfile ${APP_DIR}/Gemfile
COPY Gemfile.lock ${APP_DIR}/Gemfile.lock
RUN bundle install


# Yarn settings
COPY package.json ${APP_DIR}/package.json
COPY yarn.lock ${APP_DIR}/yarn.lock


COPY . $APP_DIR


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]

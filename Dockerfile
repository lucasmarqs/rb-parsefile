FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME


ADD jobs_importer.gemspec* $APP_HOME/
ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

RUN gem build $APP_HOME/jobs_importer.gemspec
RUN gem install $APP_HOME/jobs_importer-0.1.0.gem

From ruby:3.0.2-alpine

RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client

ADD . /Online-store
WORKDIR /Online-store
RUN bundle install

ENV BUNDLE_PATH /gems
RUN yarn install
RUN bundle install
RUN npm install

EXPOSE 3000
CMD ["bash"]
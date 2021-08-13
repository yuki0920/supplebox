FROM ruby:3.0.0 AS nodejs

WORKDIR /tmp

# install node
RUN curl -LO https://nodejs.org/dist/v12.22.1/node-v12.22.1-linux-x64.tar.xz
RUN tar xvf node-v12.22.1-linux-x64.tar.xz
RUN mv node-v12.22.1-linux-x64 node

FROM ruby:3.0.0

# copy node from installed node
COPY --from=nodejs /tmp/node /opt/node
ENV PATH /opt/node/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends build-essential libpq-dev \
  && rm -rf /var/lib/apt/lists/*

# install yarn
RUN apt-get install apt-transport-https
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

WORKDIR /${WORKDIR}
COPY Gemfile /${WORKDIR}/Gemfile
COPY Gemfile.lock /${WORKDIR}/Gemfile.lock
RUN gem install bundler:2.0.2
COPY . /${WORKDIR}

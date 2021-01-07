# Node.jsダウンロード用ビルドステージ
FROM ruby:2.7.2 AS nodejs

WORKDIR /tmp

# Node.jsのダウンロード
RUN curl -LO https://nodejs.org/dist/v14.15.4/node-v14.15.4-linux-x64.tar.xz
RUN tar xvf node-v14.15.4-linux-x64.tar.xz
RUN mv node-v14.15.4-linux-x64 node

# Railsプロジェクトインストール
FROM ruby:2.7.2

# nodejsをインストールしたイメージからnode.jsをコピーする
COPY --from=nodejs /tmp/node /opt/node
ENV PATH /opt/node/bin:$PATH

# yarnのインストール
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
ENV PATH /home/rails/.yarn/bin:/home/rails/.config/yarn/global/node_modules/.bin:$PATH

RUN gem install bundler

WORKDIR /myapp

# Dockerのビルドステップキャッシュを利用するため先にGemfileを転送し、bundle installする

COPY --chown=rails Gemfile Gemfile.lock package.json yarn.lock /app/

RUN bundle config set app_config .bundle
RUN bundle config set path .cache/bundle

# mount cacheを利用する
RUN --mount=type=cache,uid=1000,target=/app/.cache/bundle \
  bundle install && \
  mkdir -p vendor && \
  cp -ar .cache/bundle vendor/bundle
RUN bundle config set path vendor/bundle

RUN --mount=type=cache,uid=1000,target=/app/.cache/node_modules \
  bin/yarn install --modules-folder .cache/node_modules && \
  cp -ar .cache/node_modules node_modules

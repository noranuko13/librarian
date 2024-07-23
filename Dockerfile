# パッケージを更新する
FROM vvakame/review:5.9
RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends \
    graphviz

# アプリ専用のディレクトリを定義する
ARG DIR="/librarian"
RUN mkdir ${DIR}
WORKDIR ${DIR}

# License Finderをインストールする
RUN gem install license_finder

# 依存関係をインストールする
ADD Gemfile ${DIR}/Gemfile
ADD Gemfile.lock ${DIR}/Gemfile.lock
RUN bundle install

# 全ファイルをイメージに含める
ADD . ${DIR}

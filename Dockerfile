# パッケージを更新する
FROM vvakame/review:5.5
RUN apt-get update -qq

# アプリ専用のディレクトリを定義する
ARG DIR="/librarian"
RUN mkdir ${DIR}
WORKDIR ${DIR}

# 依存関係をインストールする
ADD Gemfile ${DIR}/Gemfile
ADD Gemfile.lock ${DIR}/Gemfile.lock
RUN bundle install

# 全ファイルをイメージに含める
ADD . ${DIR}

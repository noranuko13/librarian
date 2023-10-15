# librarian


## 動作環境

Docker, Docker Compose がインストールされている必要がある。

```shell
$ docker -v
$ docker compose version
```


## Reference

```shell
# イメージをビルドする
$ docker compose build
$ docker compose build --no-cache
# コンテナを起動する
$ docker compose up review -d
# コンテナに入る
$ docker compose exec review bash
# コンテナから出る
$ exit
# コンテナを停止する
$ docker compose down review
```

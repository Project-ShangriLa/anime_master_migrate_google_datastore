# Anime API Master MySQL to Google Cloud Datastore


## 概要

AnimeAPIのマスターデータをGoogle Cloud Datasotreに保存するスクリプトです


- AnimeAPI-MasterServer-type1(MySQLに接続)
- AnimeAPI-MasterServer-type2(Google Cloud Datasoreに接続)

type1からtype2へのマイグレーションをする場合に使用するスクリプトです。

## 準備

```
cp config/config.sample.json config/config.json
```

設定ファイルを編集してください

## 実行例

```
 bundle exe ruby migrate.rb 2016 4
```

設定ファイルは第三引数で変更できます

```
 bundle exe ruby migrate.rb 2016 4 ./private/config.json
```

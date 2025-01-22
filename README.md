# rails-rsec-sandbox
Rspecの便利な書き方まとめ

## 環境構築
https://github.com/rails/docked?tab=readme-ov-file

- 公式イメージからrails newする
```
docked rails new rails-rspec-sandbox --database=postgresql --css=tailwind --skip-bundle
```
- 開発用のDockerfileとcompose.ymlを準備して、build
```
docker compose build
``` 
- database.ymlを設定し、DBを作成
```
docker compose run --rm web rails db:prepare
``` 
# 起動
```
docker compose up
``` 
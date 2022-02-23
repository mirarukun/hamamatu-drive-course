# アプリケーション名
hamamatu-drive-course

# アプリケーションの概要
浜松に住む２０代の若者の「ドライブする時に目的地を決められない」という悩みを解消するために作られたアプリケーション

# URL
https://hamamatu-drive-course.herokuapp.com/

# テスト用アカウント
・ Basic認証ID：miura  
・ Basic認証パスワード：soutei9618  
・ メールアドレス：aaa@aaa
・ パスワード：soutei9618

# 利用方法
## スポット投稿
## スポット検索

# アプリケーションを作成した背景
友達と遊びに行く時に、車で迎えに行ったはいいが、集まってからどこに行こうかとなることがよくある。
原因はドライブをするのが目的であり、スポットはその時のお互いの気分を考慮したいためであると考えている。
そんな時に、目的地のジャンル、今日運転したい道の方角、昼なのか夜なのかの時間帯、所要時間を打ち込むだけで目的地の候補を出してくれるアプリがあれば便利であると感じて開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1fSJ0HxWTEG0yh2hSeAoqcx3TAq58uTb3pIRLDSqa9_Y/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能

# データベース設計
https://gyazo.com/168a788ffb412ed432a0a54d924e43da

# 画面遷移図

# 開発環境

# ローカルでの動作方法

# 工夫したポイント


## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association
has_many :spots, dependent: :destroy  
has_many :comments, dependent: :destroy

## spots テーブル

| Column           | Type       | Options     |
| ---------------- | -----------| ----------- |
| name             | string     | null: false |
| score            | integer    | null: false |
| text             | string     | null: false |
| genre_id         | string     | null: false |
| time_required_id | string     | null: false |
| situation_id     | string     | null: false |
| direction_id     | string     | null: false |
| user             | references | null: false, foreign_key:true |

### Association
belongs_to :user  
has_many :comments, dependent: :destroy  
has_one_attached :image

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| score   | integer | null: false |
| text    | string | null: false |
| user    | references | null: false, foreign_key: true |
| spot    | references | null: false, foreign_key: true |

### Association  
belongs_to :user  
belongs_to :spot

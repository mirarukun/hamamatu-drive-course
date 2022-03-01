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
①トップページのボタンを押し、新規登録する。（既に登録してあればログイン）  
②ログインすると、スポット投稿ボタンが表示されるので押して登録ページへ遷移。  
③スポット登録ページには登録フォームが表示されているので、質問にそって項目を埋めて「スポットを登録する」ボタンを押す。  
④「スポットを登録する」ボタンを押すとトップページに自動で遷移して、登録したスポットが選んだジャンルの場所に表示される。  
⑤表示されているスポット名をクリックすると、スポットの詳細ページに遷移して、詳細情報が確認できる。

# アプリケーションを作成した背景
友達と遊びに行く時に、車で迎えに行ったはいいが、集まってからどこに行こうかとなることがよくある。  
原因はドライブをするのが目的であり、スポットはその時のお互いの気分を考慮したいためであると考えている。  
そんな時に、目的地のジャンル、今日運転したい道の方角、昼なのか夜なのかの時間帯、所要時間を打ち込むだけで目的地の候補を出してくれるアプリがあれば便利であると感じて開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1fSJ0HxWTEG0yh2hSeAoqcx3TAq58uTb3pIRLDSqa9_Y/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明
ユーザー管理機能・・・新規登録、ログイン、ログアウトが自由にできる。  
スポット登録機能・・・スポットを登録できるフォームに情報を記入することで登録することが出来る。  
スポット一覧表示機能（トップページ）・・・登録したスポットのスポット名、評価点がジャンル別に表示される。  
スポット詳細機能・・・登録したスポットの詳細情報および添付した画像を確認することが出来る。  
スポット編集機能・・・登録したスポットの詳細情報および添付した画像を変更することが出来る。  
スポット削除機能・・・登録したスポットのデータを削除することができる。  
ドライブスポット決定機能・・・フォームに情報を入力することで、今日のドライブ場所を決定してくれる。  
# 実装予定の機能 
ドライブスポットおすすめ機能・・・詳細ページにそのドライブスポットと同じ方角のスポットを表示し「一緒にどうですか？」と案内する機能をつける。  
他ユーザーからのスポット評価、コメント機能・・・登録したユーザー以外のユーザーがそのスポットに対して、コメントや評価をすることが出来る。  

# データベース設計
https://gyazo.com/168a788ffb412ed432a0a54d924e43da

# 画面遷移図


# 開発環境
・フロントエンド  
・バックエンド  
・インフラ  
・テキストエディタ

# ローカルでの動作方法
以下のコマンドを順に実行。  
％ git clone https://hamamatu-drive-course.herokuapp.com  
% cd hamamatu-drive-course  
% bundle install  
% yarn install

# 工夫したポイント
スポット一覧ページ（トップページ）は登録したスポットのジャンル別に表示される様に実装した。
トップページには、スポット名と評価点のみの表示にして、スポットをクリックすることでそのスポットの詳細を、
見ることができる様に実装しました。



# テーブル設計
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
| text             | text       | null: false |
| genre_id         | integer    | null: false |
| time_required_id | integer    | null: false |
| situation_id     | integer    | null: false |
| direction_id     | integer    | null: false |
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

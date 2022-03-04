# アプリケーション名
浜松のドライブスポット紹介所

# アプリケーションの概要
浜松に住む２０代の若者の「ドライブする時に目的地を決められない」という悩みを解消するために作られたアプリケーション  
今日のドライブスポットを手軽に決めることが出来るように実装した。

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
②ログインすると、「スポットを投稿する」ボタンが表示されるので押して登録ページへ遷移。  
③スポット登録ページには登録フォームが表示されているので、質問にそって項目を埋めて「スポットを登録する」ボタンを押す。  
④「スポットを登録する」ボタンを押すとトップページに自動で遷移して、登録したスポットが選んだジャンルの場所に表示される。  
⑤表示されているスポット名をクリックすると、スポットの詳細ページに遷移して、詳細情報が確認できる。

## スポット検索
①トップページの「ドライブの目的地を自分で決められないって人はこちらのボタンを押してね！！」をクリック。  
②「ジャンル検索」「所要時間検索」「シチュエーション検索」「方角検索」の４つの質問のうち、１つ以上回答して、「スポット検索！」ボタンをクリックする。  
③ページの下記に条件に当てはまるスポットが表示される。  
④「このスポットの詳細」ボタンを押すことで、スポットの詳細ページに遷移することができる。

## 評価、コメント投稿機能
①自分以外のユーザーが投稿したスポット名をクリック（スポットの評価をつけるシステムなので自分が投稿したスポットではコメントできない。）  
②詳細ページの下部に評価点とコメントを記入できるフォームがあるので記入（評価点は半角数字0〜10で記入）して、「このスポットの評価を投稿」ボタンを押す。  
③詳細ページに投稿したコメントが表示される。


# アプリケーションを作成した背景
友達と遊びに行く時に、車で迎えに行ったはいいが、集まってからどこに行こうかとなることがよくある。  
原因はドライブをするのが目的であり、スポットはその時のお互いの気分を考慮したいためであると考えている。  
そんな時に、目的地のジャンル、今日運転したい道の方角、昼なのか夜なのかなどの時間帯、目的地までの所要時間を打ち込むだけで目的地の候補を出してくれるアプリがあれば便利であると感じて開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1fSJ0HxWTEG0yh2hSeAoqcx3TAq58uTb3pIRLDSqa9_Y/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明
ユーザー管理機能・・・新規登録、ログイン、ログアウトが自由にできる。  
https://gyazo.com/555e0188f4a59c65c3937275ff886796  
https://gyazo.com/a1cc7a5d53b7a91b67a1f50dc992d9c3  


スポット登録機能・・・スポットを登録できるフォームに情報を記入することで登録することが出来る。  
https://gyazo.com/1ce5140ed7b9d6573bcb0b86854f6437

スポット一覧表示機能（トップページ）・・・登録したスポットのスポット名、評価点がジャンル別に表示される。  
https://gyazo.com/1fbe626ce06271e22982c317da6e2554

スポット詳細機能・・・登録したスポットの詳細情報および添付した画像を確認することが出来る。  
https://gyazo.com/3cbcaa2babaab16ea4e3bc544ded9681

ドライブスポットおすすめ機能・・・詳細ページにそのドライブスポットと同じ方角のスポットを表示し「一緒に行けそうなスポット」と表示してくれる。
また「このスポットの詳細」ボタンを押すことでそのスポットの詳細ページへ遷移できる。  
https://gyazo.com/6f78cf481a001a7420d62a4229c38a38

スポット編集機能・・・登録したスポットの詳細情報および添付した画像を変更することが出来る。 
https://gyazo.com/d81f56138c4169955452a363ca97242e 

スポット削除機能・・・登録したスポットのデータを削除することができる。  
https://gyazo.com/78c379f6ca00b3f2bdd3169faa1d6767

ドライブスポット検索機能・・・フォームに情報を入力することで、ドライブスポットを検索してくれる。  
https://gyazo.com/5a838496b8a15d1ae4dd90c7f6f2aa9f

スポット評価、コメント機能・・・登録したユーザー以外のユーザーがそのスポットに対して、コメントや評価をすることが出来る。  
https://gyazo.com/5d41a48816b03d75aebcb9a447f94d02

コメント削除機能・・・コメントを投稿したユーザーが自分のコメントを削除することが出来る。  
https://gyazo.com/995c67c294becb3b3e824cf057161675

# データベース設計
https://gyazo.com/168a788ffb412ed432a0a54d924e43da

# 画面遷移図
https://gyazo.com/8e60e298d3cbac91dc570a63e6d68b53

# 開発環境
・フロントエンド : html, css, bootstrap  
・バックエンド : ruby 2.6.5p114, Rails 6.0.4.6  
・インフラ : heroku/7.59.2 darwin-x64 node-v12.21.0　,git version 2.32.0  
・テスト : rspec  
・テキストエディタ :  Visual Studio Code  


# ローカルでの動作方法
以下のコマンドを順に実行。  
％ git clone https://hamamatu-drive-course.herokuapp.com  
% cd hamamatu-drive-course  
% bundle install  
% yarn install

# 工夫したポイント
スポット一覧ページ（トップページ）は登録したスポットのジャンル別に表示される様に実装した。  
また、検索ページにはそのスポットの詳細ページへ遷移できるように実装し、スポットの詳細ページには同じ方角のスポットを
「一緒に行けそうなスポット」として表示することで、ユーザーがドライブコースを考えやすいように工夫した。  


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

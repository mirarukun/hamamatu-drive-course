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
| text             | string     | null: false |
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

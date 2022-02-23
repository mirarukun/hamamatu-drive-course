class Spot < ApplicationRecord
belongs_to :user  
# has_many :comments, dependent: :destroy コメントモデル作ったらコメントアウト外す
has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :genre
belongs_to :time_required
belongs_to :situation
belongs_to :direction
end

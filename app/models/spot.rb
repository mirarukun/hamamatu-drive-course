class Spot < ApplicationRecord
belongs_to :user  
# has_many :comments, dependent: :destroy コメントモデル作ったらコメントアウト外す
has_one_attached :image

end

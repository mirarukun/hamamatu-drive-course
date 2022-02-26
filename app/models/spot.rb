class Spot < ApplicationRecord
  belongs_to :user
  # has_many :comments, dependent: :destroy コメントモデル作ったらコメントアウト外す
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :time_required
  belongs_to :situation
  belongs_to :direction

  with_options presence: true do
    validates :name
    validates :score, inclusion: { in: 0..10 }, format: { with: /\A[0-9]+\z/ }
    validates :text
  end
  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :genre_id
    validates :time_required_id
    validates :situation_id
    validates :direction_id
  end
  validates :score, numericality: true
end

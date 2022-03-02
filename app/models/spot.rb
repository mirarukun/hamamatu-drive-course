class Spot < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
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
  validates :genre_id, numericality: { greater_than_or_equal_to:1 ,less_than_or_equal_to:9, message: "is invalid" }
  validates :time_required_id, numericality: { greater_than_or_equal_to:1 ,less_than_or_equal_to:6, message: "is invalid" }
  validates :situation_id, numericality: { greater_than_or_equal_to:1 ,less_than_or_equal_to:6, message: "is invalid" }
  validates :direction_id, numericality: { greater_than_or_equal_to:1 ,less_than_or_equal_to:4, message: "is invalid" }
  validates :score, numericality: true
end

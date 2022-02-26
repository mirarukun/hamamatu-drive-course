class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  has_many :spots, dependent: :destroy
  # has_many :comments, dependent: :destroy コメントモデル作ったらコメントアウト外す
end

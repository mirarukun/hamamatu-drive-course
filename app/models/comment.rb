class Comment < ApplicationRecord
  belongs_to :user  
  belongs_to :spot

  with_options presence: true do
    validates :score, inclusion: { in: 0..10 }, format: { with: /\A[0-9]+\z/ } , numericality: true
    validates :text
  end
end

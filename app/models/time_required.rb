class TimeRequired < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '2時間以上' },
    { id: 2, name: '2〜1時間程度' },
    { id: 3, name: '60〜30分程度' },
    { id: 4, name: '30分以下' }
  ]

  include ActiveHash::Associations
  has_many :spots
  
  end
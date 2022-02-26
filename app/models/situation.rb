class Situation < ActiveHash::Base
  self.data = [
    { id: 1, name: '朝' },
    { id: 2, name: '昼' },
    { id: 3, name: '夕方' },
    { id: 4, name: '夜' },
    { id: 5, name: '日中ならどの時間帯でも可' },
    { id: 6, name: '夜も含め、どの時間帯でも可' }
  ]

  include ActiveHash::Associations
  has_many :spots
end

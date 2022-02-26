class TimeRequired < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '片道2時間以上かかる（遠距離）' },
    { id: 2, name: '片道90分以上~120分未満' },
    { id: 3, name: '片道60分以上~90分未満' },
    { id: 4, name: '片道45分以上~60分未満' },
    { id: 5, name: '片道30分以上~45分未満' },
    { id: 6, name: '片道30分かからない' }
  ]

  include ActiveHash::Associations
  has_many :spots
end

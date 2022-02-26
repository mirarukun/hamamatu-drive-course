class Direction < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '浜松より北' },
    { id: 2, name: '浜松より東' },
    { id: 3, name: '浜松より西' },
    { id: 4, name: '浜松にある' }
  ]

  include ActiveHash::Associations
  has_many :spots
  
  end
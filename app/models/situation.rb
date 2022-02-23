class Situation < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '朝' },
    { id: 2, name: '昼' },
    { id: 3, name: '夜' },
    { id: 4, name: 'どの時間帯でも可' }
  ]
  end
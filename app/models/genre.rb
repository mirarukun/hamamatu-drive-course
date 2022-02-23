class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '食事' },
    { id: 2, name: 'ショッピング' },
    { id: 3, name: '夜景' },
    { id: 4, name: '公園' },
    { id: 5, name: '海' },
    { id: 6, name: '山' },
    { id: 7, name: '神社、寺院関係' },
    { id: 8, name: '城' },
    { id: 9, name: 'その他' }
  ]
  end
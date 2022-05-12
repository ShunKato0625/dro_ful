class Request < ActiveHash::Base

  self.data = [
    {id: 1, name: '該当なし'},
    {id: 2, name: '空港などの周辺地域の上空'},
    {id: 3, name: '緊急用務空域'},
    {id: 4, name: '150m以上での高さでの飛行'},
    {id: 5, name: '人工集中地区の上空'},
    {id: 6, name: '夜間飛行'},
    {id: 7, name: '目視外飛行'},
    {id: 8, name: '人・物・車等の30m未満飛行'},
    {id: 9, name: 'イベント上空飛行'},
    {id: 10, name: '危険物輸送'},
    {id: 11, name: '物件投下'}
  ]

  # include ActiveHash::Associations
  # has_many :post_requests , dependent: :destroy

end
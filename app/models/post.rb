class Post < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  belongs_to :customer
  belongs_to :post

  validates_uniqueness_of :post_id, scope: :customer_id
end

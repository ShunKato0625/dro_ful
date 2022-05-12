class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  has_one_attached :image

  belongs_to :customer
  has_many :favorites          , dependent: :destroy
  has_many :post_comments      , dependent: :destroy
  has_many :favorited_customers, through: :favorites,
                                 source: :customer
  # has_many :requests           , through: :post_requests
  # has_many :post_requests      , dependent: :destroy


  validates :title             , presence: true
  validates :remarks           , presence: true,
                                 length: { maximum: 300 }
  validates :access            , presence: true,
                                 length: { maximum: 200 }
  validates :authorization     , presence: true,
                                 length: { maximum: 200 }
  validates :drone_type        , presence: true
  validates :rate              , numericality: {
                                 less_than_or_equal_to: 5,
                                 greater_than_or_equal_to: 1,
                                 }, presence: true
  validates :shooting_date     , presence: true
  validates :image             , presence: true
  validates :request           , presence: true
  validates :prefecture_id        , presence: true



  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end  


  is_impressionable counter_cache: true

end

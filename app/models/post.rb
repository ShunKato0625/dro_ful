class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  has_one_attached :image

  belongs_to :customer
  has_many :favorites          , dependent: :destroy
  has_many :post_comments      , dependent: :destroy
  has_many :favorited_customers, through: :favorites,
                                 source: :customer


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

  # 投稿はタイトル名、都道府県名、申請の名前で検索可能。
  # prefecture_idを都道府県名に表示変更。
  # タイトル名、申請項目名は部分一致、都道府県名は完全一致。
  def self.search_post(search)
    prefecture = Prefecture.find_by(name: search)
    if prefecture != nil
      Post.where(prefecture_id: prefecture)
    else
      Post.where(['title LIKE(?) OR request LIKE(?)',
                  "%#{search}%", "%#{search}%"])
    end
  end

  # 配列の"[" "]"を消して文字列の配列にして返す
  def get_request_strings
    self.request.split(',').map {|m| m.delete('[]"\\\\')}
  end


  is_impressionable counter_cache: true

end

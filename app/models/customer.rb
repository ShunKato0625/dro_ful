class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :posts          , dependent: :destroy
  has_many :post_comments  , dependent: :destroy
  has_many :favorites      , dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post

  validates :last_name       , presence: true
  validates :last_name_kana  , presence: true
  validates :first_name      , presence: true
  validates :first_name_kana , presence: true
  validates :nick_name       , presence: true,
                               uniqueness: true
  #validates :introduction    , presence: true
  #自己紹介はバリデーションをかけない

  #デフォルトプロフィール画像の設定
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  # is_deletedがfalseならtrueを返すようにする
  def active_for_authentication?
    super && (is_deleted == false)
  end

  #会員はニックネームで検索
  def self.search_customer(search)
      Customer.where('nick_name LIKE(?)',"%#{search}%")
  end



end

class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts          , dependent: :destroy
  has_many :post_comments  , dependent: :destroy
  has_many :favorites      , dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :book

  validates :last_name       , presence: true
  validates :last_name_kana  , presence: true
  validates :first_name      , presence: true
  validates :first_name_kana , presence: true
  validates :nick_name       , presence: true,
                               uniqueness: true

  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def active_for_authentication?
    # is_deletedがfalseならtrueを返すようにする
    super && (is_deleted == false)
  end


end

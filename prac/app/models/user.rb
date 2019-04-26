class User < ActiveRecord::Base

  has_many :comments
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable
  has_many :articles, dependent: :destroy
  has_many :favorites
  has_many :favorite_articles, through: :favorites, source: :favorited, source_type: 'Article'
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider
      user.avatar_url = auth.info.image
      user.username = auth.info.name
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end


end
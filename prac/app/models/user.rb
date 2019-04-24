class User < ActiveRecord::Base
    has_many :comments
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable,  :validatable
        has_many :articles, dependent: :destroy
        has_many :favorites
        has_many :favorite_articles, through: :favorites, source: :favorited, source_type: "Article"
end
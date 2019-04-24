class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :favorites, dependent: :destroy
	validates :title, presence: true, length: {minimum: 5}
end

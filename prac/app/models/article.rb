class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :sections
	belongs_to :category
	accepts_nested_attributes_for :sections, allow_destroy: true

	validates :user_id, presence: true
	validates :title, presence: true, length: {minimum: 5}
def self.search(search)
  if search
    where('text LIKE ?', "%#{search}%")
  else
  	Article.all
  end
end
end

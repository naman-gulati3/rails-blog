 class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :sections
	belongs_to :category
	validates :title, presence: true, length: {minimum: 5}
def self.search(search)
  if search
    where('text LIKE ?', "%#{search}%")
  else
  	Article.all
  end
end
end

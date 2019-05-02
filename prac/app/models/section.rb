class Section < ActiveRecord::Base
  belongs_to :article
  validates :body , presence: true
end
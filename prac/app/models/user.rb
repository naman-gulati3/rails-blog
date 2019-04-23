class User < ActiveRecord::Base
  has_many :comments
  devise :database_authenticatable, :registerable,
     	:recoverable, :rememberable,  :validatable
        has_many :articles, dependent: :destroy

end
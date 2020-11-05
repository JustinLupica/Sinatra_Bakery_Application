class User < ActiveRecord::Base
   has_secure_password
   has_many :posts

   validates :username, uniqueness: true, presence: true
   validates :password_digest, presence: true
end
class User < ApplicationRecord
  # has_secure_token :access_token

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects
  has_many :api_keys

end

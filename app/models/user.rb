class User < ApplicationRecord
  has_many :dogs
  has_secure_password
  validates :email, presence: true, uniqueness: true
end

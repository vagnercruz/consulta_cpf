class User < ApplicationRecord
  has_secure_password

  has_many :consultas

  validates :email, presence: true, uniqueness: true
end

class User < ApplicationRecord
  has_secure_password
  has_many :stuffed_animals
  has_many :animals, through: :stuffed_animals
end

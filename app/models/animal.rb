class Animal < ApplicationRecord
  has_many :stuffed_animals
  has_many :users, through: :stuffed_animals
end

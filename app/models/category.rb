class Category < ApplicationRecord
  has_many :topps
  has_many :bottoms
end

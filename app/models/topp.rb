class Topp < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  mount_uploader :image, ImageUploader
end

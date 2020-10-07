class Topp < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true

  mount_uploader :image, ImageUploader
end

class Topp < ApplicationRecord
  belongs_to :user
  validates :category, presence: true
  
  def self.search(search)
    if search
      Topp.where('category LIKE(?)', "%#{search}%")
    else
      Topp.all
    end
  end
  mount_uploader :image, ImageUploader
end

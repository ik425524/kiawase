class Bottom < ApplicationRecord
  belongs_to :user
  validates :category, presence: true

  def self.search(search)
    if search
      Bottom.where('category LIKE(?)', "%#{search}%")
    else
      Bottom.all
    end
  end
  mount_uploader :image, ImageUploader
end

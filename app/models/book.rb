class Book < ApplicationRecord
  
  has_one_attached :image
  has_one_attached :profile_image
  
  belongs_to :user
  
  validates :title, presence: true
  validates :body, presence: true
  
  def get_profile_image(width, height)
    
    unless profile_image.attached?
      return "default-image"
    end
    
    profile_image.variant(resize_to_limit: [width, height]).processed
  
  end
  
end

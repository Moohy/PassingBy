class Post < ApplicationRecord  
  belongs_to :user
  has_many :comments
  has_many :likes
  has_one_attached :image#, service: :s3

  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
                                    

  private 
  def self.near_by_posts city
    self.where(city: city)
  end
end

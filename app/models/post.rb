class Post < ApplicationRecord  
  belongs_to :user

  private 
  def self.near_by_posts city
    self.where(city: city)
  end
end

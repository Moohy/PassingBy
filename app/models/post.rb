class Post < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  
  belongs_to :user

  private 
  def self.near_by_posts coor
    self.near([40.71, -100.23], 50, units: :km)
  end
end

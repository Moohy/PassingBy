class RemoveLangitudeAndLatitudeFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :longitude
    remove_column :posts, :latitude
  end
end

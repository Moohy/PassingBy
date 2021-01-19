class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.float :longitude, default: 144.9633, null: false
      t.float :latitude, default: -37.8140, null: false
      t.string :city, default: 'Melbourne', null: false

      t.timestamps
    end
    add_index :posts, :city
  end
end

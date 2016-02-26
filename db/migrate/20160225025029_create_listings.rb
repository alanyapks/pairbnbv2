class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id
      # Basic
      t.string :property_type
      t.string :room_type
      t.integer :accommodates
      t.integer :bedrooms
      t.integer :beds
      t.integer :bathrooms
      t.integer :price_id
      t.integer :amenity_id
      t.integer :min_stay
      t.string :avability
      # Description
      t.string :name
      t.text :description
      # Location
      t.string :country
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      # Price
      t.timestamps null: false
    end
  end
end

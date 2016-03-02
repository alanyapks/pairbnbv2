class ChangeImageToImages < ActiveRecord::Migration
  def change
  	remove_column :users, :image, :string
  	add_column :users, :images, :json
  end
end

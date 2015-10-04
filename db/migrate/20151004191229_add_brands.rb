class AddBrands < ActiveRecord::Migration
  def change
  	add_column :users, :brands, :text
  end
end

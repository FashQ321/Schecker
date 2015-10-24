class AddOtherBrands < ActiveRecord::Migration
  def change
  	add_column :users, :other_brands, :string
  end
end

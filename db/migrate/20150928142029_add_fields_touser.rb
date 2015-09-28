class AddFieldsTouser < ActiveRecord::Migration
  def change
  	add_column :users, :age, :integer
  	add_column :users, :height, :decimal, :precision => 5, :scale => 2
  	add_column :users, :weight, :decimal, :precision => 5, :scale => 2
  	add_column :users, :type_of_height, :string, default: "inches"
  	add_column :users, :type_of_weight, :string, default: "libres"
  	add_column :users, :neck, :decimal, :precision => 3, :scale => 1
  	add_column :users, :bust, :decimal, :precision => 3, :scale => 1
  	add_column :users, :waist, :decimal, :precision => 3, :scale => 1
  end
end

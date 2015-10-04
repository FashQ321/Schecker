class AddmeasuresToUser < ActiveRecord::Migration
  def change
  	add_column :users, :chest, :decimal, :precision => 3, :scale => 1
  	add_column :users, :sleeves, :decimal, :precision => 3, :scale => 1
  	add_column :users, :hips, :decimal, :precision => 3, :scale => 1
  	add_column :users, :inside_legs, :decimal, :precision => 3, :scale => 1
  	add_column :users, :feet, :decimal, :precision => 3, :scale => 1
  	add_column :users, :fit, :string
  end
end

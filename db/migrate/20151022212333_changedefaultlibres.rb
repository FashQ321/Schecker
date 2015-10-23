class Changedefaultlibres < ActiveRecord::Migration
  def change
  	change_column :users, :type_of_weight, :string, :default => "lbs"
  end
end

class AddBodyShape < ActiveRecord::Migration
  def change
  	add_column :users, :body_shape, :integer
  end
end

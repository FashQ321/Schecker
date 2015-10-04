class AddStatusToUser < ActiveRecord::Migration
  def change
  	add_column :users, :welcome_step, :string
  end
end

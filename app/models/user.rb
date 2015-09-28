class User < ActiveRecord::Base

	#DB SCHEMA
	# t.string   "first_name"
	# t.string   "last_name"
	# t.string   "gender"
	# t.string   "email",                  default: "",       null: false
	# t.integer  "age"
	# t.decimal  "height",                 precision: 5, scale: 2
	# t.decimal  "weight",                 precision: 5, scale: 2
	# t.decimal  "neck",                   precision: 3, scale: 1
	# t.decimal  "bust",                   precision: 3, scale: 1
	# t.decimal  "waist",                  precision: 3, scale: 1
	# t.string   "type_of_height",                                 default: "inches"
	# t.string   "type_of_weight",                                 default: "libres"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

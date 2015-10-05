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
	# t.decimal  "chest",                  precision: 3, scale: 1
	# t.decimal  "sleeves",                precision: 3, scale: 1
	# t.decimal  "hips",                   precision: 3, scale: 1
	# t.decimal  "inside_legs",            precision: 3, scale: 1
	# t.decimal  "feet",                   precision: 3, scale: 1
	# t.string   "fit"
	# t.integer  "body_shape"
	# t.string   "type_of_height",                                 default: "inches"
	# t.string   "type_of_weight",                                 default: "libres"
	# t.string   "welcome_step"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :temp_brands

  validates :gender, presence: { :message => "You must choose a gender" }, :if => :active_or_gender?
  validates :body_shape, presence: { :message => "You must choose a body shape" }, :if => :active_or_body_shape?
  validates :brands, presence: { :message => "You must choose at least one brand" }, :if => :active_or_brands?
  validate 	:measurements, :if => :active_or_measurements?
  validates :age, presence: { :message => "You must set an age" }, :if => :active_or_age?
  validate 	:signup, :if => :active_or_signup?
  

  def password_required?
	  new_record? ? false : super
	end

	def email_required?
	  false
	end

	def active?
    welcome_step == 'active'
  end

  def male?
  	gender == "male"
  end

  def female?
  	gender == "female"
  end

  def active_or_gender?
  	(welcome_step.include?('gender') || active?) if welcome_step
  end

  def active_or_body_shape?
  	(welcome_step.include?('body_shape') || active?) if welcome_step
  end

  def active_or_measurements?
  	(welcome_step.include?('measurements') || active?) if welcome_step
  end

  def active_or_age?
  	(welcome_step.include?('age') || active?) if welcome_step
  end

  def active_or_brands?
  	(welcome_step.include?('brands') || active?) if welcome_step
  end

  def active_or_signup?
  	(welcome_step.include?('signup') || active?) if welcome_step
  end

  def measurements
		errors.add(:neck, "You must provide a measure for the neck") if neck.nil? && male?
		errors.add(:bust, "You must provide a measure for the bust") if bust.nil? && female?
		errors.add(:waist, "You must provide a measure for the waist") if waist.nil?
		errors.add(:chest, "You must provide a measure for the chest") if chest.nil? && male?
		errors.add(:sleeves, "You must provide a measure for the sleeves") if sleeves.nil? && male?
		errors.add(:hips, "You must provide a measure for the hips") if hips.nil?
		errors.add(:inside_legs, "You must provide a measure for the inside legs") if inside_legs.nil?
		errors.add(:feet, "You must provide a measure for the feet") if feet.nil?
  end

  def signup
  	errors.add(:first_name, "You must provide a first name") if first_name.blank?
  	errors.add(:last_name, "You must provide a last name") if last_name.blank?
		errors.add(:email, "You must provide an email") if email.blank?
		errors.add(:password, "You must provide a password") if password.blank?
  end

end

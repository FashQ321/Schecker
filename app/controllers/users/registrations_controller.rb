class RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  def update
    # For Rails 4
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update) { |u| u.permit(:gender, :email, :welcome_step, :body_shape, :neck, :chest, :sleeves, :waist, :hips, :inside_legs, :feet, :temp_brands, :brands, :age, :height, :weight) }
    
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
    else
      redirect_to :back
    end
  end

  protected

   def after_sign_in_path_for(resource)
      completed_path
   end

   def after_sign_up_path_for(resource)
    completed_path
   end

   def after_inactive_sign_up_path_for(resource)
    completed_path
   end

end
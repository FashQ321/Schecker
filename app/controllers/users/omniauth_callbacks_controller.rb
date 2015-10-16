class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user, session[:token_id])

    if @user.persisted? 
      sign_in @user
      redirect_to completed_path
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end
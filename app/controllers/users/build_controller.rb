class Users::BuildController < ApplicationController
  include Wicked::Wizard

  steps :gender, :body_shape, :measurements, :age, :brands, :signup

  def show
    @user = User.find(params[:user_id])
    @step = step
    render_wizard
  end


  def update
    @user = User.find(params[:user_id])
    params[:user][:welcome_step] = step.to_s
    params[:user][:brands] = params[:user][:temp_brands].join(',') if step.to_s == "brands" && params[:user][:temp_brands]
    params[:user][:welcome_step] = 'active' if step == steps.last
    @user.update_attributes(user_params)
    render_wizard @user
  end


  def create
    @user = User.create
    redirect_to wizard_path(steps.first, :user_id => @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:gender, :email, :welcome_step, :body_shape, :neck, :chest, :sleeves, :waist, :hips, :inside_legs, :feet, :temp_brands, :brands, :age)
  end

end
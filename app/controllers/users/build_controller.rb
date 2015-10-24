class Users::BuildController < ApplicationController
  
  include Wicked::Wizard
  steps :gender, :body_shape, :age, :measurements, :brands, :signup

  before_action :load_brands, only: [:show, :update, :finish_wizard_path]

  def show
    @step = step
    render_wizard
  end


  def update
    @brands = Hash[@brands.to_a.shuffle]
    params[:user][:welcome_step] = step.to_s
    params[:user][:brands] = params[:user][:temp_brands].join(',') if step.to_s == "brands" && params[:user][:temp_brands]
    params[:user][:welcome_step] = 'active' if step == steps.last
    @user.update_attributes(user_params)
    render_wizard @user
  end


  def create
    @user = User.create(registration_token: SecureRandom.hex(9))
    redirect_to wizard_path(steps.first, :user_id => @user.id)
  end

  def finish_wizard_path
    sign_in @user
    completed_path
  end

  private

  def user_params
    params.require(:user).permit(:gender, :email, :welcome_step, :body_shape, :neck, :chest, :sleeves, :waist, :hips, :inside_legs, :feet, :temp_brands, :brands, :age, :height, :weight, :type_of_height, :type_of_weight, :first_name, :last_name, :full_name, :email, :password, :other_brands)
  end

  def load_brands
    @user = User.find(params[:user_id])
    session[:token_id] = @user.registration_token

    if step == :brands
      if @user.female?
        @brands = {
          "Acne Studios" => "acne_studios.png",
          "Adidas" => "adidas.jpg",
          "All Saints" => "all_saints.jpg",
          "Asos" => "asos.jpg",
          "Boden" => "boden.jpg",
          "Boohoo" => "boohoo.jpeg",
          "Burton" => "burton.jpg",
          "Carven" => "carven.jpeg",
          "Coast" => "coast.jpg",
          "COS" => "cos.jpg",
          "Dolce&gabbana" => "dolce&gabbana.jpg",
          "Dorothy Perkins" => "dorothy_perkins.jpeg",
          "Evans" => "evans.jpeg",
          "French Connection" => "french_connection.jpg",
          "Gucci" => "gucci.jpg",
          "H&M" => "h&m.jpeg",
          "Hobbs" => "hobbs.jpeg",
          "Jaeger" => "jaeger.png",
          "J. Crew" => "jcrew.jpeg",
          "Jigsaw" => "jigsaw.jpeg",
          "John Lewis" => "john_lewis.jpg",
          "Karen Millen" => "karen_millen.jpg",
          "Lipsy" => "lipsy.jpeg",
          "L.K. Bennett" => "lk_bennett.jpg",
          "Luis Vitton" => "luis_vitton.jpg",
          "M&S" => "m&s.jpeg",
          "Mango" => "mango.jpg",
          "Matalan" => "matalan.png",
          "Miss Selfridge" => "miss_selfridge.jpg",
          "Missguided" => "missguided.jpeg",
          "Monsoon" => "monsoon.png",
          "Motel" => "motel.jpeg",
          "New Balance" => "new_balance.jpg",
          "New Look" => "new_look.jpg",
          "Next" => "next.jpg",
          "Oasis" => "oasis.jpg",
          "3.1 Phillip Lim" => "phillip_lim.jpeg",
          "Primark" => "primark.jpeg",
          "Reiss" => "reiss.jpeg",
          "River Island" => "river_island.png",
          "Ted Banker" => "ted_baker.jpg",
          "TOPSHOP" => "topshop.jpeg",
          "Uniqlo" => "uniqlo.jpeg",
          "Wallis" => "wallis.jpg",
          "Warehouse" => "warehouse.jpeg",
          "Whistles" => "whistles.jpeg",
          "Zara" => "zara.jpeg"
        }
      else
        @brands = {
          "Topman" => "topman.jpg",
          "H&M" => "h&m.jpeg",
          "M&S" => "m&s.jpeg",
          "River Island" => "river_island.png",
          "Next" => "next.jpg",
          "New Look" => "new_look.jpg",
          "Reiss" => "reiss.jpeg",
          "Burton" => "burton.jpg",
          "Asos" => "asos.jpg",
          "Primark" => "primark.jpeg",
          "J. Crew" => "jcrew.jpeg",
          "COS" => "cos.jpg",
          "Matalan" => "matalan.png",
          "New Balance" => "new_balance.jpg",
          "Jaeger" => "jaeger.png",
          "Boden" => "boden.jpg",
          "John Lewis" => "john_lewis.jpg",
          "Whistles" => "whistles.jpeg",
          "Ted Banker" => "ted_baker.jpg",
          "Jigsaw" => "jigsaw.jpeg",
          "Carven" => "carven.jpeg",
          "Dolce&gabban" => "dolce&gabbana.jpg",
          "Gucci" => "gucci.jpg",
          "Luis Vitton" => "luis_vitton.jpg"
        }
      end
      @brands = Hash[@brands.to_a.shuffle]
    end
  end




















end
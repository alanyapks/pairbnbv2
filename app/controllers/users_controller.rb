class UsersController < Clearance::UsersController
	before_action :require_login, only: [:index, :show, :edit, :update]
	
  def index
    @user = current_user
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
    # byebug
  	@user = User.new user_params
  	# @user.image = params[:file]
    # @user.update(params [:image])
  	if @user.save
  		sign_in @user
    else
      render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :encrypted_password, :image, :first_name, :last_name, :birthday)
  end

end

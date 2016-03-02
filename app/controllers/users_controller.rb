class UsersController < Clearance::UsersController
	before_action :require_login, only: [:index, :show]
	
  def index
    @user = current_user
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new user_params
  	@user.image = params[:file]
    # @user.update(params [:image])
  	if @user.save
      flash[:success] = "Created new user"
  		sign_in @user
    else
      render 'new'
  	end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :encrypted_password, :image)
  end

end

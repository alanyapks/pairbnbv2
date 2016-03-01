class UsersController < Clearance::UsersController
	before_action :require_login, only: [:index, :show]
	
  def index
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new
  	@user.image = params[:file]
  	if @user.save
  		redirect_to @user
  	end
  end

  private
  def user_params
  	params.require(:user).permit
  end 
end

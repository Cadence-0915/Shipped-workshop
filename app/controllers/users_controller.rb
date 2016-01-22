class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @boats = Boat.where(user_id: @user.id)
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	if @user.save
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :username, :password, :avatar)
  end
end

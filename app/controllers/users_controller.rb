class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:first_name, :email, :password, :city_id))
    redirect_to(root_path)
  end

  def index
    @users = User.all
  end
end

class UsersController < ApplicationController

  def new
  	@user=User.new
  end

  def create
  	user = User.create(user_params)
  	flash[:success] = 'User created'
  	session[:user_id] = user.id 
  	redirect_to root_path
  end

  private 
  def user_params
  	params.require(:user).permit(:email, :password, :name)
  end
end

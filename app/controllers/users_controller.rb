class UsersController < ApplicationController
before_action :authenticate_user!
def index
  @users = User.where.not(id: current_user.id, language: current_user.language)
  @user = User.find_by(id: params[:id])
end

# binding.pry
def show
  @user = User.find(params[:id])
  @users = @user.following.all
end

def edit
  @user = User.find_by(id: params[:id])
end

def update
  user = User.find_by(id: params[:id])
  user.update(user_params)
  redirect_to user_path(user.id)
end

def following
  @user = User.find(params[:id])
end

def followers

end

private
def user_params
  params.require(:user).permit(:name, :language, :profile_image)
end
end

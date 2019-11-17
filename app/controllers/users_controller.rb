class UsersController < ApplicationController
before_action :authenticate_user!
def index
  @users = User.where.not(id: current_user.id, language: current_user.language)
end

def show
  @user = User.find_by(id: params[:id])
end

private
def user_params
  params.require(:user).permit(:name, :language)
end
end

class UsersController < ApplicationController
before_action :authenticate_user!
def index
  @users = User.where.not(id: current_user.id, language: current_user.language)
  @user = User.find_by(id: params[:id])
end

# binding.pry
def show
  @user = User.find(params[:id])
  @followings = @user.following.all
  @followers = @user.followers.all
  @matches = @user.match

  @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end


def edit
  @user = User.find(params[:id])
end

def update
  user = User.find(params[:id])
  user.update(user_params)
  redirect_to user_path(user.id)
end

def following
  @user = User.find(params[:id])
end

def followers

end

def search
  latitude = params[:latitude].to_f
  longitude = params[:longitude].to_f
  @users = User.within_box(3, current_user.latitude, current_user.longitude).where.not(id: current_user.id).where.not(language: current_user.language)
end


private
def user_params
  params.require(:user).permit(:name, :language, :profile_image, :address, :latitude, :longitude)
end
end

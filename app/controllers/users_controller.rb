class UsersController < ApplicationController
  def profile
    @user = User.find(params[:id])
    if @user.nil?
      if User.find(params[:id]).nil?
        @user = User.find(params[:id])
        @artist = params[:artist]
        @resultuser = User.where("id = ? ", @artist.to_i)
      end
    end
    # redirect_to users_profile_path(@resultuser)
  end
end

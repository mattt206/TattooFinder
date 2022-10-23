class UsersController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @artist = params[:artist]
    @resultuser = User.where("id = ? ", @artist.to_i)
    # redirect_to users_profile_path(@resultuser)
  end


end

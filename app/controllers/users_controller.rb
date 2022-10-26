class UsersController < ApplicationController
  def profile
    @booking = Booking.all
    @user = User.find(params[:id])
    if @user.nil?
      if User.find(params[:id]).nil?
        @user = User.find(params[:id])
        @artist = params[:artist]
        @resultuser = User.where("id = ? ", @artist.to_i)
      end
    end
    if !params[:button].nil?
      pending
    end
  end

  private

  def pending
    @apoitment = Booking.find(params[:button].to_i)
    @apoitment.status = true
    @apoitment.save

  end
end

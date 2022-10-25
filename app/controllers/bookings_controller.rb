class BookingsController < ApplicationController
  before_action :set_bookings, only: %i[show edit update destroy]


  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def show
    @artist = User.find(@booking.artist_info)
  end

  def create
    @user = User.find(params[:user_id])
    @booking = Booking.new(bookings_params)
    @booking.user_id = current_user.id
    @booking.status = false
    @booking.artist_info = params["booking"][:artist]
    if @booking.save
      redirect_to  booking_path(@booking.id)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def destroy
    @user.id = @booking.user_id
    @booking.destroy
    redirect_to profile_path(@user.id), status: :see_other
  end

  private

  def set_bookings
    @booking = Booking.find(params[:id])
  end

  def bookings_params
    params.require(:booking).permit(:start_time, :end_time, :artist_info)
  end


end

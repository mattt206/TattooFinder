class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artist, only: %i[create show destroy]
  # crear el chat
  # capturar el current_user y el id del profile
  # enlazar estos dos y mostrar
  def new
    @user = User.find(params[:user_id])
    @chatroom = Chatroom.new
    @name = "hola"
    # raise
  end

  def create
    # @current_artist = User.find(params[:user_id])
    # @user = current_user
    @chatroom = Chatroom.new(chats_params)
    if @chatroom.save
      # redirect_to chatroom_path(@chatroom.id)
      # redirect_to chatroom_path(@chatroom.id, @artist)
      redirect_to user_chatroom_path(@artist.id, @chatroom.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
   if !params[:format].nil?
    @artist = User.find(params[:format])
    params[:newartistkey] = @artist.id
   end
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @message[:artist_info] = @artist.id
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @user = User.find(@artist.id)
    @user.chats.delete(@chatroom.id.to_s)
    @user.save
    @chatroom.destroy
    redirect_to profile_path(@artist.id), status: :see_other
  end

  private

  def set_artist
    @artist = User.find(params[:user_id])
  end

  def chats_params
    params.require(:chatroom).permit(:name)
  end

end

class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artist, only: %i[create show]
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

  private

  def set_artist
    @artist = User.find(params[:user_id])
  end

  def chats_params
    params.require(:chatroom).permit(:name)
  end

end

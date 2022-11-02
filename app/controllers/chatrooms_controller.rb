class ChatroomsController < ApplicationController
  before_action :authenticate_user!
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
    @artist = User.find(params[:user_id])
    params[:newkey] = @artist.id
    @chatroom = Chatroom.new(chats_params)
    if @chatroom.save
      redirect_to chatroom_path(@chatroom.id, @artist)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @artist = User.find(params[:format])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    params[:newartistkey] = @artist.id
  end

  private

  def chats_params
    params.require(:chatroom).permit(:name)
  end

end

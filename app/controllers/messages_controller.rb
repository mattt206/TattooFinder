class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.created_at = Time.now
    @message.user = current_user
    artist
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        message: render_to_string(partial: "message", locals: { message: @message }),
        sender_id: @message.user.id
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def artist
    @message.artist_info = params[:message][:artist_info].to_i
    @artist = User.find(@message.artist_info)
    if @artist.chats.empty?
      @artist.chats << @chatroom.id
    else
      @artist.chats << @chatroom.id if !@artist.chats.include?(@chatroom.id.to_s)
    end
    @artist.save
  end

  def message_params
    params.require(:message).permit(:content, :artist_info)
  end
end

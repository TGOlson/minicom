class MessagesController < ApplicationController

  def index
    @user = User.includes(:messages).find(params[:user_id])
  end

  def new
    @user = User.find params[:user_id]
    @message = Message.new
  end

  def create
    @user = User.find params[:user_id]
    @message = Message.create params[:message]

    if @message.save
      @user.messages << @message
      redirect_to user_messages_path(@user)
    else
      redirect_to new_user_message_path(@user)
    end
  end
end
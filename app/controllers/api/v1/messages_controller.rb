class Api::V1::MessagesController < ApplicationController
  before_action :load_channel

  def index
    @messages = @channel.messages
    @results = @messages.map do |message|
      {
        id: message.id,
        author: message.user.email.gsub(/@.*/, ''),
        content: message.content,
        created_at: message.created_at
      }
    end
    render json: @results
  end

  def create
    @message = Message.new(message_params);
    @message.channel = @channel
    @message.user = current_user
    @results = {
      id: @message.id,
      author: @message.user.email.gsub(/@.*/, ''),
      content: @message.content,
      created_at: @message.created_at
    }
  if @message.save!
    render json: @results, status: :created
  else
    render json: {
      id: 100,
      author: "admin",
      content: "There's been an error",
      created_at: Time.now
    }
  end
  end

  private

  def load_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end

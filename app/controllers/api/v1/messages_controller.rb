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
  end

  private

  def load_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end

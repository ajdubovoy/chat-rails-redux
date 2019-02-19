class Api::V1::ChannelsController < ApplicationController
  def index
    @channels = Channel.all
    @results = @channels.map { |channel| channel.name }
    render json: @results
  end
end

class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # stream_from "room_channel_#{params[:room_id]}"
    stream_from "room_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

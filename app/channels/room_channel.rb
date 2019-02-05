class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.new(
                    content:          data['content'],
                    picture_data_uri: data['data_uri']
              )
    message.save
  end
end

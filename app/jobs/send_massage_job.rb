class SendMassageJob < ApplicationJob
  queue_as :default

  def perform(message)
    theirs=ApplicationController.render(
      partial: "messages/theirs",
      locals: {message:message}
    )
    mine = ApplicationController.render(
      partial: 'messages/mine',
      locals: { message: message}
    )
    message1=message
    attachment_data1= message.attachment_data
    ActionCable.server.broadcast("room_channel_#{message.room_id}",
                                 { mine: mine,
                                   theirs: theirs,
                                   message:message,
                                   attachment_data:message.attachment_data
                                 })
  end
end

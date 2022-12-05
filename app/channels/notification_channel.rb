class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    notification = Notification.find_by(user_id: current_user.id)
    stream_for notification
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

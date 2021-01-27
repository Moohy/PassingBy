class NewCommentNotificationJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    # Do something later

    NewCommentMailer.email_owner(post_id).deliver_now
  end
end

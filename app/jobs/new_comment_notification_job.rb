class NewCommentNotificationJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    # Do something later
    puts "########### in job"

    NewCommentMailer.email_owner(post_id).deliver_now
  end
end

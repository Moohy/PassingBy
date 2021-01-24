class NewCommentNotificationJob < ApplicationJob
  queue_as :active_job_passing_by

  def perform(post_id)
    # Do something later
    NewCommentMailer.email_owner(post_id)
  end
end

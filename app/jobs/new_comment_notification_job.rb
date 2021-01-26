class NewCommentNotificationJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    # Do something later
    puts "########### in job"
    # message = NewCommentMailer.email_owner(post_id)
    # # message['X-SES-FROM-ARN'] = 'arn:aws:ses:us-east-1:012345678910:identity/mohammed@memes.com'
    # message.deliver
    NewCommentMailer.email_owner(post_id).deliver_now
  end
end

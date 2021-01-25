class NewCommentMailer < ApplicationMailer
    default from: 'no-reply@passing-by.com'

    def self.email_owner(post_id)
        puts "########### in mailer"

        @post = Post.find_by(id: post_id)
        puts "########### #{@post.id}"

        owner = @post.user.email
        puts "########### #{owner}"
        ActionMailer::Base.mail(to: owner, subject: "New comment to post ##{post_id}",
            template_path: 'new_comment_mailer',
            template_name: 'new_comment_mailer')
    end
end

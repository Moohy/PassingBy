class NewCommentMailer < ApplicationMailer
    default from: 'no-reply@passing-by.com'

    def email_owner(post_id)
        @post = Post.find(id: post_id)
        @owner = @post.user.email
        mail(to: @owner, subject: "New comment to post ##{@post.id}",
            template_path: 'new_comment_mailer',
            template_name: 'new_comment_mailer')
    end
end

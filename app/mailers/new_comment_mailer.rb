class NewCommentMailer < ApplicationMailer
    default from: 'mode99910@gmail.com'

    def email_owner(post_id)
        @post = Post.find_by(id: post_id)
        owner = @post.user.email

        mail(to: "mode99910@gmail.com",
            subject: 'New comment to your passingBy post') do |format|
            format.text { render plain: "New comment to post #{post_id}" }
        end
    end
end

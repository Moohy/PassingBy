class NewCommentMailer < ApplicationMailer
    default from: 'mode99910@gmail.com'

    def email_owner(post_id)
        puts "########### in mailer"

        @post = Post.find_by(id: post_id)
        puts "########### #{@post.id}"

        owner = @post.user.email
        puts "########### #{owner}"
        # ActionMailer::Base.mail(to: "mode99910@gmail.com", subject: "New comment to post ##{post_id}",
        #     template_path: 'new_comment_mailer',
        #     template_name: 'new_comment_mailer')

        mail(to: "mode99910@gmail.com",
            subject: 'Welcome to passingBy') do |format|
            format.text { render plain: 'New comment to post ##{post_id}"' }
        end
    end
end

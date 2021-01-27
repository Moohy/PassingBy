class NewPostsMailer < ApplicationMailer
    default from: 'mode99910@gmail.com'

    def email_users(users)

        mail(to: "mode99910@gmail.com",
            subject: 'Checkout new posts') do |format|
            format.text { render plain: "New posts on your current location" }
        end
    end
end

# app/mailers/media_mailer.rb
class MediaMailer < ApplicationMailer
  default from: 'no-reply@watchedmediaapp.com'

  def new_media_email(user, medium)
    @user = user
    @medium = medium
    mail(to: @user.email, subject: 'New Media Added by you.')
  end
end

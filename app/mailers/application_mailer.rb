class ApplicationMailer < ActionMailer::Base
  default from: "lionstep-noreply@lionstep.com"

  def test_completed(user)
    @user = user
    @results = user.get_test_results
    attachments.inline['logo.png'] = File.read("#{Rails.root}/public/images/logo.png")
    attachments.inline['logo_white.png'] = File.read("#{Rails.root}/public/images/logo_white.png")
    attachments.inline['icon_facebook.png'] = File.read("#{Rails.root}/public/images/icon_facebook.png")
    mail to: user.email, subject: "Gracias por participar en nuestro test."
  end

end

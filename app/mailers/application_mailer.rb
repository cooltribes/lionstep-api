class ApplicationMailer < ActionMailer::Base
  default from: "lionstep-noreply@lionstep.com"

  def test_completed(user)
    @user = user
    @result = user.get_test_results[:name]
    mail to: user.email, subject: "Gracias por participar en nuestro test."
  end

end

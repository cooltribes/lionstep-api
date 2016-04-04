class ApplicationMailer < ActionMailer::Base
  add_template_helper(V1::EmailHelper)
  default from: "\"Lionstep\" <lionstep-noreply@lionstep.com>"

  def test_completed(user)
    @user = user
    @results = user.get_test_results
    mail to: user.email, subject: "Gracias por participar en nuestro test."
  end

end

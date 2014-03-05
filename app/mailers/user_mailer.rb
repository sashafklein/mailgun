class UserMailer < ActionMailer::Base
  default from: "whatever@email.com"

  def test(text="Some Text")
    mail(to: 'whoever@email.com', subject: 'Whatever') do |format|
      format.html { render text: text }
    end
  end
end

class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def test_email
    mail(to: 'whoever@email.com', from: 'whoever@otheremail.com', subject: 'Whatever') do |format|
      format.html { render text: "Here's some text" }
    end
  end
end

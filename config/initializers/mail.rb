# This interceptor just makes sure that local mail 
# only emails you.
# http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails
class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to =  'sasha@bloc.io'
    message.cc = nil
    message.bcc = nil
  end
end

ActionMailer::Base.smtp_settings = {
  :port           => 587, 
  :address        => 'smtp.mailgun.org',
  :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
  :password       => ENV['MAILGUN_SMTP_PASSWORD'],
  :domain         => 'mailguntester.com',
  :authentication => :plain,
  :content_type   => 'text/html'
}
ActionMailer::Base.delivery_method = :smtp

if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end
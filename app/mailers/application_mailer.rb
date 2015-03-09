class ApplicationMailer < ActionMailer::Base
  default from: ENV['FT_MAIL_SENDER']
  layout 'mailer'
end

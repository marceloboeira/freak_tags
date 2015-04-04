class DeviseCustomMailer < Devise::Mailer
  default from: ENV['FT_MAIL_SENDER']
  layout 'mailer'
end

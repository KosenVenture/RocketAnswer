class ContactMailer < ActionMailer::Base
  default from: "webmaster@rocket-answer.com"

  def user(contact)
    @contact = contact

    mail to: 'ml@kosen-venture.com', subject: '[Rocket Answer]お問い合わせがあります'
  end
end

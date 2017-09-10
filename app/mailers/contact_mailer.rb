class ContactMailer < ApplicationMailer
  def user(contact)
    @contact = contact

    mail to: 'ml@kosen-venture.com',
      bcc: 'webmaster@rocket-answer.com',
      subject: '[Rocket Answer]お問い合わせがあります'
  end
end

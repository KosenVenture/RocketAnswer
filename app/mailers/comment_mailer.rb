class CommentMailer < ApplicationMailer
  default from: "notification@rocket-answer.com"

  def notification_mail(email, user, answer)
    @answer = answer
    @user = user
    mail to: email, subject: "コメントが付きました"
  end
end

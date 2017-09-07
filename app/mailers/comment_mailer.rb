class CommentMailer < ApplicationMailer
  default from: "notification@rocket-answer.com"

  def notification_mail(user, answer)
    @answer = answer
    @user = user
    mail to: user.email, subject: "コメントが付きました"
  end
end

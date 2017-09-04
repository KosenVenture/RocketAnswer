class CommentMailer < ApplicationMailer
  default from: "from@example.com"

  def notification_mail(answer)
    @answer = answer

    mail(
      subject: "新しいコメントが付きました。"
      to: @user.email
    ) do |format|
        format.text
    end
  end
end

class ContactsController < ApplicationController
  def show
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactMailer.user(@contact).deliver_now
      redirect_to root_path, notice: 'お問い合わせを送信しました。'
    else
      render :show
    end
  rescue
    render :show, alert: 'サーバエラーが発生しました。再送信を試行してください。'
  end

private
  def contact_params
    params.require(:contact).permit(:name, :email, :body, :accept)
  end
end

class ContactsController < ApplicationController
  def show
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      redirect_to root_path, notice: 'お問い合わせを送信しました。'
    else
      render :show
    end
  end

private
  def contact_params
    params.require(:contact).permit(:name, :email, :body, :accept)
  end
end
# frozen_string_literal: true

class ContactsController < ApplicationController
  def new; end

  def create
    if current_user
      @contact = current_user.contacts.build(contact_params)
    else
      @contact = Contact.new(contact_params)
    end

    if @contact.save
      ContactMailer.creation_email(@contact).deliver_now
      flash[:success] = 'お問い合わせを送信しました'
      redirect_to contacts_path
    else
      flash.now[:danger] = 'お問い合わせの送信に失敗しました'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :content, :user_id, :name, :email)
  end
end

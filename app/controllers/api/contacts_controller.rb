# frozen_string_literal: true

module Api
  class ContactsController < ApplicationController
    def create
      contact = if current_user
                  current_user.contacts.build(contact_params)
                else
                  Contact.new(contact_params)
                end

      if contact.save
        ContactMailer.creation_email(contact).deliver_now

        render json: {}, status: :ok
      else
        render_errors(contact)
      end
    end

    private

    def contact_params
      params.require(:contacts).permit(:title, :content, :user_id, :name, :email)
    end
  end
end

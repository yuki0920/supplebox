# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  default from: 'suppleboxmanager@gmail.com'
  def creation_email(contact)
    @contact = contact
    mail(
      subject: 'SuppleBoxへのお問い合わせありがとうございます。',
      to: contact.email,
      bcc: ENV['GMAIL_USERNAME'],
      from: ENV['GMAIL_USERNAME']
    )
  end
end

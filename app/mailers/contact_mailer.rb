class ContactMailer < ApplicationMailer
default from: 'suppleboxmanager@gmail.com'
  def creation_email(contact)
    @contact = contact
    mail(
      subject: 'SuppleBoxへのお問い合わせありがとうございます。',
      to: contact.email,
      cc: ENV['GMAIL_USERNAME'],
      from: ENV['GMAIL_USERNAME']
      )
  end
end
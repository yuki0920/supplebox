class ContactMailer < ApplicationMailer
default from: 'yukichallenge.com@gmail.com'
  def creation_email(contact)
    @contact = contact
    mail(
      subject: 'お問い合わせ',
      to: 'ywsep20@gmail.com',
      from: 'yukichallenge.com@gmail.com'
      )
  end
end

# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def creation_email(contact)
    @contact = contact
    mail(
      subject: 'SuppleBoxへのお問い合わせありがとうございます。',
      to: contact.email,
      bcc: 'suppleboxmanager@gmail.com',
      # NOTE: from に環境変数を設定するとdevやtest環境で設定していない場合
      #      既定のアドレスを設定している
      from: 'suppleboxmanager@gmail.com'
    )
  end
end

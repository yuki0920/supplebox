# frozen_string_literal: true

module LoginSupport
  def sign_in_as(user)
    visit login_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password

    expect(page).to have_button 'ログイン'
    click_button 'ログイン'
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end

# frozen_string_literal: true

module LoginSupport
  def sign_in_as(user)
    visit login_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password

    expect(page).to have_button 'ログイン'
    click_button 'ログイン'
    expect(page).to have_content 'プロフィール'
  end

  def sign_in(user)
    params = {session: {email: user.email, password: 'password'}}.to_json
    headers = {'Content-Type' => 'application/json'}

    post '/api/sessions', headers: headers, params: params
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end

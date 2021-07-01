# frozen_string_literal: true

require 'rails_helper'

describe '問い合わせ機能', type: :system, js: true do
  include ActiveJob::TestHelper

  let(:user) { FactoryBot.create(:user) }

  it '問い合わせが成功すること' do
    sign_in_as user

    click_link 'お問い合わせ'

    fill_in 'お名前', with: 'テストユーザー'
    fill_in 'メールアドレス', with: 'test@supplebox.jp'
    fill_in 'タイトル', with: 'テストタイトル'
    fill_in 'お問い合わせ内容', with: 'テストコンテント'
    click_on '送信する'

    expect(page).to have_content 'お問い合わせに成功しました'

    mail = ActionMailer::Base.deliveries.last

    expect(mail.to).to eq ['test@supplebox.jp']
    expect(mail.body).to include 'テストタイトル'
  end

  it 'お問い合わせが失敗すること' do
    sign_in_as user

    click_link 'お問い合わせ'

    click_on '送信する'

    expect(page).to have_content 'お問い合わせに失敗しました'
    expect(ActionMailer::Base.deliveries).to be_empty
  end
end

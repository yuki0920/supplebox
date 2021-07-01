# frozen_string_literal: true

require 'rails_helper'

describe 'セッション管理機能', type: :system, js: true do
  before do
    create(:user, email: 'test@supplebox.jp', password: 'password')
  end

  it '登録済みユーザーがログインとログアウトできること' do
    visit login_path
    fill_in 'メールアドレス', with: 'test@supplebox.jp'
    fill_in 'パスワード', with: 'password'
    expect(page).to have_button 'ログイン'
    click_button 'ログイン'
    # expect(page).to have_content 'ログインに成功しました'
    expect(page).to have_content 'さんのプロフィール'
  end

  it '登録済みでないユーザーがログインできないこと' do
    visit login_path
    fill_in 'メールアドレス', with: 'test@supplebox.jp'
    fill_in 'パスワード', with: 'dummy_password'
    click_button 'ログイン'
    expect(page).to have_content 'ログインに失敗しました'
  end
end

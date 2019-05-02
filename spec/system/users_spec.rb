require 'rails_helper'

describe 'ユーザー表示機能', type: :system do

  it '新しいユーザーを作成できること' do
    expect {
      visit root_path
      click_link '新規登録'
      fill_in 'ユーザー名', with: 'TestUser'
      fill_in 'ニックネーム', with: 'テストユーザー'
      fill_in 'メールアドレス', with: 'tester@supplebox.jp'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード（確認）', with: 'password'
      click_on '登録する'
    }.to change{ User.count }.by(+1)
    expect(page).to have_content 'ユーザを登録しました。'
    expect(page).to have_content 'テストユーザー'
  end

  it 'プロフィールを編集出来ること' do
    # sign_in_as user
    visit root_path
    click_link '新規登録'
    fill_in 'ユーザー名', with: 'TestUser'
    fill_in 'ニックネーム', with: 'テストユーザー'
    fill_in 'メールアドレス', with: 'tester@supplebox.jp'
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード（確認）', with: 'password'
    click_on '登録する'
    click_on 'プロフィールを編集する'
    fill_in '自己紹介', with: 'こんにちは.'
    click_on '更新する'
    expect(page).to have_content 'プロフィールを更新しました'
  end  
  
  describe '一覧表示機能' do
    before do
      user_a = FactoryBot.create(:user, name: 'UserA', nickname: 'ユーザーA', email: 'a@example.com')
    end
    
    context 'ログイン状態に関わらず' do
      before do
        visit users_path
      end
      
      it 'ユーザーAが表示される' do
        expect(page).to have_content 'UserA'
      end
    end
  end
  
  describe '詳細表示機能' do
    context 'ログイン状態に関わらず' do
      
      before do
        user_a = FactoryBot.create(:user, name: 'UserA', nickname: 'ユーザーA', email: 'a@example.com')
        visit user_path(user_a)
      end
      
      it 'ユーザーAが表示される' do
        expect(page).to have_content 'UserA'
      end
    end
  end
end
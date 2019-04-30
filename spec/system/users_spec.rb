require 'rails_helper'

describe 'ユーザー表示機能', type: :system do
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
require 'rails_helper'

describe 'ユーザー表示機能', type: :system do
  describe '一覧表示機能' do
    before do
      user_a = FactoryBot.create(:user, name: 'UserA', nickname: 'ユーザーA', email: 'a@example.com')
    end
    
    context 'ユーザーAがログインしていとき' do
      before do
        visit users_path
      end
      
      it 'ユーザーAが表示される' do
        expect(page).to have_content 'UserA'
      end
    end
  end
end
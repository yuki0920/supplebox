require 'rails_helper'

describe 'ブランド投稿機能', type: :system do
  
  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:user, admin: true) }
  let!(:brand){ FactoryBot.create(:brand) }
  
  describe '新規作成機能' do
    it '管理者はブランド登録できること' do
      sign_in_as admin_user
      visit new_brand_path
      expect{
        fill_in 'ブランドネーム', with: 'テストブランド'
        fill_in 'ブランド内容', with: 'テストブランド紹介文'
        # attach_file 'ブランド画像', 'tmp/test/test_normal_image.jpg'
        click_on '投稿する'
      }.to change{ Brand.count }.by(+1)
      expect(page).to have_content 'ブランドを登録しました'
    end
  end
  
  describe '編集機能' do
    it '管理者はブランドを更新できること' do
      sign_in_as admin_user
      visit edit_brand_path(brand)
      fill_in 'ブランドネーム', with: 'アップデートブランドネーム'
      click_on '投稿する'
      expect(page).to have_content 'ブランドを更新しました'
      expect(page).to have_content 'アップデートブランドネーム'
    end
  end
  
  describe '削除機能' do
    it '管理者はブランドを削除できること' do
      sign_in_as admin_user
      visit brand_path(brand)
      expect{
        click_on 'ブランドを削除する'
      }.to change{ Brand.count }.by(-1)
      expect(page).to have_content 'ブランドを削除しました'
    end
  end
  
  describe '一覧表示機能' do
    it '一般ユーザーはブランド一覧を確認できること' do
      visit brands_path
      expect(page).to have_content(brand.name)
    end
  end
  
  describe '詳細表示機能' do
    it '一般ユーザーはブランド詳細を確認できること' do
      visit brand_path(brand)
      expect(page).to have_content(brand.name)
    end
  end
  
end
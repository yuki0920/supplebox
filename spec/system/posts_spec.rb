require 'rails_helper'

describe '口コミ投稿機能', type: :system do
  
  let(:user) { FactoryBot.create(:user) }
  let(:product) { FactoryBot.create(:product) }
  let!(:post) { FactoryBot.create(:post, user: user, product: product, content: '一般の口コミ')}
  let!(:other_post) { FactoryBot.create(:post, content: 'その他の口コミ')}
  
  describe '新規作成機能' do
    it '口コミ投稿できる場合' do
      sign_in_as user
      product = FactoryBot.create(:product)
      visit product_path(product)
      expect{
        fill_in 'タイトル', with: 'テストタイトル'
        fill_in '口コミ内容', with: 'テストコンテント'
        attach_file '口コミ画像', 'tmp/test/test_normal_image.jpg'
        click_on '投稿する'
      }.to change{ Post.count }.by(+1)
      expect(page).to have_content '口コミを投稿しました'
    end
  end
  
  describe '一覧表示機能' do
    before do
      sign_in_as user
    end
    
    it '一覧表示に表示されること' do
      click_on '口コミを探す'
      expect(page).to have_content 'テストタイトル' #トップページの口コミ
    end
    
    it 'トップページに表示されること' do
      click_on 'トップページ'
      expect(page).to have_content 'テストタイトル' #トップページの口コミ
    end
    
    it 'ユーザー詳細ページに表示されること' do
      click_on 'マイページ'
      expect(page).to have_content 'テストタイトル' #ユーザープロフィールの口コミ
    end
    
  end

  describe '一覧検索機能' do
    context '一致する口コミが存在する場合' do
      it '口コミが表示されること' do
        visit posts_path
        fill_in 'q_content_or_product_title_cont', with: post.content
        click_on '口コミを検索'
        expect(page).to have_content post.content
        expect(page).to_not have_content other_post.content
      end
    end
    
    context '一致する口コミが存在しない場合' do
      it '口コミが表示されないこと' do
        visit posts_path
        fill_in 'q_content_or_product_title_cont', with: "架空の口コミ"
        click_on '口コミを検索'
        expect(page).to_not have_content post.content
        expect(page).to_not have_content other_post.content
      end
    end
  end

    
  describe '削除機能' do  
    it '口コミを削除できること' do
      sign_in_as user
      visit user_path(user)
      expect{click_on '口コミを削除'}.to change{ Post.count}. by(-1)
      expect(page).to have_content '口コミを削除しました'
    end
  end
  
  describe '編集機能' do
    it '口コミを編集できること' do
      sign_in_as user
      visit user_path(user)
      click_on '口コミを編集'
      fill_in 'タイトル', with: 'アップデートタイトル'
      click_on '投稿する'
      expect(page).to have_content '口コミを更新しました'
      expect(page).to have_content 'アップデートタイトル'
    end
  end
end
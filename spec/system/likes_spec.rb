# frozen_string_literal: true

require 'rails_helper'

describe 'アイテムお気に入り登録機能' do
  let!(:user) { FactoryBot.create(:user) }
  let!(:product) { FactoryBot.create(:product, title: 'お気に入りアイテム') }

  context 'お気に入り登録していない場合' do
    it 'お気に入り登録できる' do
      sign_in_as user
      visit product_path(product)
      expect {
        click_on 'お気に入り登録'
      }.to change { Like.count }.by(+1)
      expect(page).to have_content 'お気に入り登録をしました。'
    end
  end

  context 'お気に入り登録している場合' do
    before do
      sign_in_as user
      visit product_path(product)
      click_on 'お気に入り登録'
    end

    xit 'お気に入りしたアイテムがトップページに表示されている', js: true do
      visit root_path
      expect(page).to have_content product.title
    end

    it 'お気に入りしたアイテムがユーザープロフィールに表示されている' do
      visit like_products_user_path(user)
      expect(page).to have_content product.title
    end

    it 'お気に入り登録を解除できる' do
      expect {
        click_on 'お気に入り登録中'
      }.to change { Like.count }.by(-1)
      expect(page).to have_content 'お気に入り登録を解除しました。'
    end
  end
end

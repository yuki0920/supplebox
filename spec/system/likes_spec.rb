# frozen_string_literal: true

require 'rails_helper'

describe 'アイテムお気に入り登録機能', type: :system, js: true do
  let!(:user) { FactoryBot.create(:user) }
  let!(:product) { FactoryBot.create(:product, title: 'お気に入りアイテム') }

  context 'お気に入り登録していない場合' do
    before do
      sign_in_as user
    end

    xit 'お気に入りに追加したアイテムがトップページに表示されている' do
      visit product_path(product)
      click_on 'お気に入り登録する'

      expect(page).to have_content 'お気に入り登録中'

      visit root_path
      expect(page).to have_content product.title
    end
  end

  context 'お気に入り登録している場合' do
    before do
      sign_in_as user
      user.like!(product)
    end

    xit 'お気に入りを解除ししたアイテムがトップページに表示されていない' do
      visit product_path(product)
      click_on 'お気に入り登録中'

      expect(page).to have_content 'お気に入り登録する'

      visit root_path
      expect(page).not_to have_content product.title
    end
  end
end

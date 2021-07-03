# frozen_string_literal: true

require 'rails_helper'

describe 'アイテムお気に入り登録機能', type: :system, js: true do
  let!(:user) { FactoryBot.create(:user) }
  let!(:product) { FactoryBot.create(:product, title: 'お気に入り追加プロテイン') }

  context 'お気に入り登録していない場合' do
    before do
      sign_in_as user
    end

    it 'お気に入りに追加したアイテムがトップページに表示されている' do
      visit product_path(product)
      find('.o-like-button__like', text: 'お気に入り登録する').click

      expect(page).to have_content 'お気に入り登録中'
    end
  end

  context 'お気に入り登録している場合' do
    before do
      sign_in_as user
      user.like!(product)
    end

    it 'お気に入りを解除ししたアイテムがトップページに表示されていない' do
      visit product_path(product)
      find('.o-like-button__unlike', text: 'お気に入り登録中').click

      expect(page).to have_content 'お気に入り登録する'
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ランキング表示機能' do
  let(:user) { FactoryBot.create(:user) }
  let!(:products) { create_list(:product, 12) }

  it '1位から12位での順位が表示されていること' do
    sign_in_as user
    visit products_path
    12.times do |n|
      all('.new_like')[n].click_on 'お気に入り登録'
    end
    visit rankings_like_path
    products.each do |product|
      expect(page).to have_content product.title
    end
    (1..12).each do |rank|
      expect(page).to have_content "#{rank} 位"
    end
  end
end

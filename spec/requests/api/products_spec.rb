# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/products', type: :request do
  before do
    create_list(:product, 14, title: 'テスト')
    FactoryBot.create(:product, title: 'プロテイン')
  end

  it 'スキーマ定義とAPIの挙動が同じであること' do
    get "/api/products"

    assert_schema_conform
  end

  it 'スキーマ定義とAPIの挙動が同じであること' do
    get "/api/products?page=2"

    assert_schema_conform
  end

  it '検索条件に合致したレスポンスを返却すること' do
    get api_products_path(q: 'プロテイン')

    data = JSON.parse(response.body)

    expect(data.count).to eq 1
  end
end

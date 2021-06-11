# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/products', type: :request do
  describe '/api/products' do
    before do
      create_list(:product, 14, title: 'テスト')
      FactoryBot.create(:product, title: 'プロテイン')
    end

    it 'スキーマ定義とAPIの挙動が同じであること' do
      get '/api/products'

      assert_schema_conform
    end

    it 'スキーマ定義とAPIの挙動が同じであること' do
      get '/api/products?page=2'

      assert_schema_conform
    end

    it '検索条件に合致したレスポンスを返却すること' do
      get api_products_path(q: 'プロテイン')

      products = JSON.parse(response.body).to_h['products']

      expect(products.count).to eq 1
    end
  end

  describe '/api/products/:id' do
    let!(:product) { create(:product) }

    it 'スキーマ定義とAPIの挙動が同じであること' do
      get "/api/products/#{product.id}"

      assert_request_schema_confirm
      assert_response_schema_confirm
    end
  end
end

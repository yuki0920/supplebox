# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/products', type: :request do
  describe 'GET /api/products' do
    before do
      create_list(:product, 14, title: 'テスト')
      FactoryBot.create(:product, title: 'プロテイン')
    end

    it 'スキーマ定義とAPIの挙動が同じであること' do
      get '/api/products?per=3&page=1'

      assert_request_schema_confirm
      assert_response_schema_confirm
    end

    it '検索条件に合致したレスポンスを返却すること' do
      keyword = URI.encode_www_form(keyword: 'プロテイン')
      get "/api/products?per=3&page=1&#{keyword}"

      products = JSON.parse(response.body).to_h['products']

      expect(products.count).to eq 1
    end
  end

  describe 'GET /api/products/:id' do
    let(:product) { create(:product) }

    it 'スキーマ定義とAPIの挙動が同じであること' do
      get "/api/products/#{product.id}"

      assert_request_schema_confirm
      assert_response_schema_confirm
    end
  end

  describe 'GET /api/products/new' do
    before do
      user = create(:user)

      sign_in user
    end

    it 'スキーマ定義とAPIの挙動が同じであること' do
      VCR.insert_cassette('requests/api/products/new', match_requests_on: [Vacuum::Matcher]) do
        query = URI.encode_www_form(keyword: 'プロテイン')
        get "/api/products/new?#{query}"

        assert_request_schema_confirm
        assert_response_schema_confirm
      end
    end
  end

  describe 'POST /api/products' do
    let(:headers) { {'Content-Type' => 'application/json'} }

    context 'パラメーターが正常な場合' do
      let(:params) { {product: attributes_for(:product)}.to_json }

      it 'スキーマ定義とAPIの挙動が同じであること' do
        post '/api/products', params: params, headers: headers

        expect(response).to have_http_status :ok
        assert_request_schema_confirm
        assert_response_schema_confirm
      end
    end

    context 'パラメーターが不正な場合' do
      let(:params) { {product: attributes_for(:product).merge(url: '')}.to_json }

      it 'スキーマ定義とAPIの挙動が同じであること' do
        post '/api/products', params: params, headers: headers

        expect(response).to have_http_status :bad_request
        assert_request_schema_confirm
        assert_response_schema_confirm
      end
    end
  end
end

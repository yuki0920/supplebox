# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/products/:product_id/like', type: :request do
  describe 'POST /api/products/:product_id/like' do
    let(:product) { create(:product) }

    before do
      user = create(:user)
      sign_in user
    end

    it 'スキーマ通りであること' do
      post "/api/products/#{product.id}/like"

      expect(response).to have_http_status :ok
      assert_request_schema_confirm
      assert_response_schema_confirm
    end
  end

  describe 'DELETE /api/products/:product_id/like' do
    let(:product) { create(:product) }

    before do
      user = create(:user)
      user.like!(product)
      sign_in user
    end

    it 'スキーマ通りであること' do
      delete "/api/products/#{product.id}/like"

      expect(response).to have_http_status :ok
      assert_request_schema_confirm
      assert_response_schema_confirm
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/products/:id', type: :request do
  let!(:product) { create(:product) }

  it 'スキーマ定義とAPIの挙動が同じであること' do
    get "/api/products/#{product.id}"

    assert_request_schema_confirm
    assert_response_schema_confirm
  end
end

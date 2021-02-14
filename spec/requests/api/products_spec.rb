# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/products', type: :request do
  before do
    create_list(:product, 15)
  end

  it 'スキーマ定義とAPIの挙動が同じであること' do
    get "/api/products"

    assert_schema_conform
  end

  it 'スキーマ定義とAPIの挙動が同じであること' do
    get "/api/products?page=2"

    assert_schema_conform
  end
end

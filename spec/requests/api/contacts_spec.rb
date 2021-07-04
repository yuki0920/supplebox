# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/contacts', type: :request do
  let(:headers) { {'Content-Type' => 'application/json'} }

  describe 'POST /api/contacts' do
    context 'リクエストの形式が正しい場合' do
      let(:params) { {contacts: {name: '名前', email: 'test@example.com', title: 'タイトル', content: '内容'}}.to_json }

      it 'スキーマ定義とAPIの挙動が同じであること' do
        post '/api/contacts', params: params, headers: headers

        assert_request_schema_confirm
        assert_response_schema_confirm
      end

      it '200 が返ること' do
        post '/api/contacts', params: params, headers: headers

        expect(response).to have_http_status(:ok)
      end
    end
  end

  context 'リクエストに name がない場合' do
    let(:params) { {contacts: {email: 'test@example.com', title: 'タイトル', content: '内容'}}.to_json }

    it 'スキーマ定義とAPIの挙動が同じであること' do
      post '/api/contacts', params: params, headers: headers

      assert_response_schema_confirm
      assert_response_schema_confirm
    end

    it '400 が返ること' do
      post '/api/contacts', params: params, headers: headers

      expect(response).to have_http_status(:bad_request)
    end
  end
end

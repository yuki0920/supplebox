# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/sessions', type: :request do
  describe 'POST /api/sessions' do
    let(:user) { create(:user) }

    context 'リクエストが正しい場合' do
      it 'スキーマ通りであること' do
        params = {session: {email: user.email, password: 'password'}}.to_json
        headers = {'Content-Type' => 'application/json'}

        post '/api/sessions', headers: headers, params: params

        expect(response).to have_http_status :ok
        assert_request_schema_confirm
        assert_response_schema_confirm
      end
    end

    context 'メールアドレスが不正な不正な場合' do
      it 'リクエストが失敗すること' do
        params = {session: {email: 'invalid@example.com', password: 'password'}}.to_json
        headers = {'Content-Type' => 'application/json'}

        post '/api/sessions', headers: headers, params: params

        expect(response).to have_http_status :bad_request
      end
    end
  end

  describe 'DELETE /api/sessions' do
    before do
      user = create(:user)

      params = {session: {email: user.email, password: 'password'}}.to_json
      headers = {'Content-Type' => 'application/json'}

      post '/api/sessions', headers: headers, params: params
    end

    it 'スキーマ通りであること' do
      delete "/api/sessions"

      expect(response).to have_http_status :ok
      assert_request_schema_confirm
      assert_response_schema_confirm
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/users', type: :request do
  describe 'GET /api/users/:id' do
    let(:user) { create(:user) }

    it 'スキーマ通りであること' do
      get "/api/users/#{user.id}"

      expect(response).to have_http_status :ok
      assert_request_schema_confirm
      assert_response_schema_confirm
    end
  end

  describe 'POST /api/users' do

    it 'スキーマ通りであること' do
      params = { user: { name: 'test', email: 'test@example.com', password: 'password', password_confirmation: 'password'} }
      post '/api/users', params: params.to_json, headers: { 'Content-Type' => 'application/json'}

      expect(response).to have_http_status :ok
      assert_request_schema_confirm
      assert_response_schema_confirm
    end
  end

  describe 'PUT /api/users/:id' do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it 'リクエストが成功すること' do
      params = { user: {
        name: 'test',
        picture: Rack::Test::UploadedFile.new('spec/images/test_normal_image.jpg', 'image/jpeg'),
        gender: '男'
      } }
      put "/api/users/#{user.id}", params: params, headers: { 'Content-Type' => 'multipart/form-dat'}

      expect(response).to have_http_status :ok
    end
  end
end

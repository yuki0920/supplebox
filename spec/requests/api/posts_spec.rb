# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/posts', type: :request do
  describe 'GET /api/posts' do
    before do
      create_list(:post, 13, title: 'テスト')
    end

    it 'リクエストが成功すること' do
      get '/api/posts'

      expect(response).to have_http_status :ok
      assert_request_schema_confirm
      assert_response_schema_confirm
    end
  end

  describe 'POST /api/posts' do
    let!(:product) { create(:product) }
    let(:headers) { {'Content-Type' => 'multipart/form-data'} }
    let(:picture) { Rack::Test::UploadedFile.new('spec/images/test_normal_image.jpg', 'image/jpeg') }
    let(:params) { {post: {product_id: product.id, title: 'タイトル', content: '内容', rate: 3.5, picture: picture}} }

    before do
      user = create(:user)
      sign_in user
    end

    it 'リクエストが成功すること' do
      post '/api/posts', params: params, headers: headers

      expect(response).to have_http_status :ok
      # assert_request_schema_confirm
      assert_response_schema_confirm
    end
  end

  describe 'PUT /api/posts/:id' do
    let!(:user) { create(:user) }
    let(:product) { create(:product) }
    let(:user_post) { create(:post, user: user) }
    let(:headers) { {'Content-Type' => 'multipart/form-data'} }
    let(:picture) { Rack::Test::UploadedFile.new('spec/images/test_normal_image.jpg', 'image/jpeg') }
    let(:params) { {post: {title: 'タイトル', content: '内容', rate: 3.5, picture: picture}} }

    before do
      sign_in user
    end

    it 'リクエストが成功すること' do
      put "/api/posts/#{user_post.id}", params: params, headers: headers

      expect(response).to have_http_status :ok
      assert_response_schema_confirm
    end
  end

  describe 'GET /api/posts/:id' do
    let(:post) { create(:post) }

    it 'リクエストが成功すること' do
      get "/api/posts/#{post.id}"

      expect(response).to have_http_status :ok
      assert_request_schema_confirm
      assert_response_schema_confirm
    end
  end

  describe 'Delete /api/posts/:id' do
    let(:user) { create(:user) }
    let(:user_post) { create(:post, user: user) }

    before do
      sign_in user
    end


    it 'リクエストが成功すること' do
      delete "/api/posts/#{user_post.id}"

      expect(response).to have_http_status :ok
      assert_request_schema_confirm
      assert_response_schema_confirm
    end
  end
end

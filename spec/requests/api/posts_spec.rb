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
    end
  end
end

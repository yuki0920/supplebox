# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/users', type: :request do
  let!(:user) { create(:user) }

  it 'スキーマ定義とAPIの挙動が同じであること' do
    get '/api/users'

    assert_request_schema_confirm
    assert_response_schema_confirm
  end
end

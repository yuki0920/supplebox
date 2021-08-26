# frozen_string_literal: true

module LoginSupport
  def sign_in(user)
    params = {session: {email: user.email, password: 'password'}}.to_json
    headers = {'Content-Type' => 'application/json'}

    post '/api/sessions', headers: headers, params: params
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end

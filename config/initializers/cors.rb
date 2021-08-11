# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV.fetch('FRONT_DOMAIN', 'localhost:8008'), 'supplebox.jp', 'supplebox.netlify.app'
    resource '*', headers: :any, methods: %i[get post patch put delete], credentials: true
  end
end

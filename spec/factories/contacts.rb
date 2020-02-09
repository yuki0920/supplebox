# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { 'TestUser' }
    email { 'test@supplebox.jp' }
    title { 'テストタイトル' }
    content { 'テストコンテント' }
  end
end

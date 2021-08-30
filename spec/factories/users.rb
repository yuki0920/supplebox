# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'TestUser' }
    nickname { 'テストユーザー' }
    sequence(:email) { |n| "tester#{n}@supplebox.tokyo" }
    password { 'password' }
    admin { false }
  end
end

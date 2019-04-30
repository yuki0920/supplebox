FactoryBot.define do
  factory :user do
    name { 'TestUser' }
    nickname { 'テストユーザー' }
    email { 'test@gmail.com'}
    password { 'password' }
  end
end
FactoryBot.define do
  factory :user do
    name {'TestUser'}
    nickname {'テストユーザー'}
    sequence(:email) { |n| "tester#{n}@supplebox.jp"}
    password {'password'}
    admin { false }
  end
end
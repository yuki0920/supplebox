FactoryBot.define do
  factory :user do
    name {'TestUser'}
    nickname {'テストユーザー'}
    email {'tester@supplebox.jp'}
    password {'password'}
  end
end
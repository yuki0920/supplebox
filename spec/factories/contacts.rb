FactoryBot.define do
  factory :contact do
    name {'TestUser'}
    email {'tester@supplebox.jp'}
    title { 'テストタイトル' }
    content { 'テストコンテント' }
  end
end
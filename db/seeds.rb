# frozen_string_literal: true

return if User.count.positive?

# ユーザー登録
User.create!(
  name: 'Admin User',
  email: 'admin@supplebox.jp',
  password: 'admin0',
  password_confirmation: 'admin0',
  nickname: '管理者',
  admin: true,
)

User.create!(
  name: 'テストアカウント',
  email: 'test@supplebox.jp',
  password: 'testsupple',
  password_confirmation: 'testsupple',
  nickname: 'テスト',
)

29.times do
  name     = Faker::Name.name
  email    = Faker::Internet.email
  password = 'password'
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    nickname: name,
  )
end

# アイテム登録
30.times do |n|
  FactoryBot.create(
    :product,
    title: "NO.#{n}プロテイン",
    url: "sample#{n}@supplebox.jp",
    image_url: '/assets/default.png',
    asin: "code#{n}",
  )
end

users = User.order(:created_at).take(6)
(1..30).each do |n|
  users.each do |user|
    user.posts.create!(
      title: Faker::Coffee.blend_name,
      content: Faker::Coffee.notes,
      rate: [1, 2, 3, 4, 5].sample,
      product_id: n,
    )
  end
end

# お気に入り登録
users = User.order(:created_at).take(6)
products = Product.all
users.each do |user|
  products.each do |product|
    user.like(product)
  end
end

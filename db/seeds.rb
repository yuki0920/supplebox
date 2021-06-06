# frozen_string_literal: true

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
  FactoryBot.create!(
    :product,
    title: "NO.#{n}プロテイン",
    url: "sample#{n}@supplebox.jp",
    image_url: '/assets/default.png',
    asin: "code#{n}",
  )
end

users = User.order(:created_at).take(6)
(1..30).each do |n|
  title = Faker::Lorem.sentence(5)
  content = Faker::Lorem.sentence
  product_id = n.to_i
  users.each do |user|
    user.posts.create!(
      title: title,
      content: content,
      rate: [1, 2, 3, 4, 5].sample,
      product_id: product_id,
    )
  end
end

# リレーションシップ
users = User.all
first_user = users.first
following = users[2..30]
followers = users[3..20]
following.each { |followed| first_user.follow(followed) }
followers.each { |follower| follower.follow(first_user) }

# お気に入り登録
users = User.order(:created_at).take(6)
products = Product.all
users.each do |user|
  products.each do |product|
    user.like(product)
  end
end

# ブランド登録
5.times do
  Brand.create!(
    name: Faker::Coffee.blend_name,
    content: Faker::Coffee.notes,
  )
end

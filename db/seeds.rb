# User.create!(name:  "Admin User",
#             email: "admin@supplebox.jp",
#             password: "admin0",
#             password_confirmation: "admin0",
#             nickname: "管理者",
#             admin: true)
# 29.times do |n|
#   name     = Faker::Name.name
#   email    = Faker::Internet.email
#   password = "password"
#   User.create!(name: name,
#             email: email,
#             password: password,
#             password_confirmation: password,
#             nickname: name)
# end

# 30.times do |n|
#   Product.create!(title: "NO.#{n}プロテイン",
#                   url: "sample#{n}@supplebox.jp",
#                   image_url: "sample_image#{n}@supplebox.jp",
#                   asin: "code#{n}")
# end

# users = User.order(:created_at).take(6)
# (1..30).each do |n|
#   title = Faker::Lorem.sentence(5)
#   content = Faker::Lorem.sentence
#   product_id = n.to_i
#   users.each { |user| user.posts.create!(title: title,
#                                         content: content,
#                                         rate: [1, 2, 3, 4, 5].sample,
#                                         product_id: product_id )}
# end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..30]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
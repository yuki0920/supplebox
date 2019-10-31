User.create!(name:  "Admin User",
            email: "admin@supplebox.jp",
            password: "admin0",
            password_confirmation: "admin0",
            nickname: "管理者",
            admin: true)
29.times do |n|
  name     = Faker::Name.name
  email    = Faker::Internet.email
  password = "password"
  User.create!(name: name,
            email: email,
            password: password,
            password_confirmation: password,
            nickname: name)
end
30.times do |n|
  Product.create!(title: "NO.#{n}プロテイン",
                  url: "sample#{n}@supplebox.jp",
                  image_url: "sample_image#{n}@supplebox.jp",
                  asin: "code#{n}")
end
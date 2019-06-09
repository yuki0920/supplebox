crumb :root do
  link "Home", root_path
end

# user#index
crumb :users do
  link "ユーザー一覧", users_path
  parent :root
end

# user#show
crumb :show_user do |user|
  link "@#{user.nickname}", user
  parent :users
end

# user#edit
crumb :edit_user do |user|
  link "プロフィール編集", edit_user_path(user)
  parent :show_user, user
end

# user#new
crumb :new_user do
  link "新規登録", signup_path
  parent :users
end

# product#index
crumb :products do
  link "アイテム一覧", products_path
  parent :root
end

# product#show
crumb :show_product do |product|
  link "#{product.title}", product
  parent :products
end

# product#edit
crumb :edit_product do |product|
  link "編集", edit_product_path(product)
  parent :show_product, product
end

# product#new
crumb :new_product do
  link "アイテム登録", new_product_path
  parent :products
end

# post#index
crumb :posts do
  link "アイテム一覧", posts_path
  parent :root
end

# post#edit
crumb :edit_post do |post|
  link "編集", edit_post_path(post)
  parent :posts
end

# brand#index
crumb :brands do
  link "ブランド一覧", brands_path
  parent :root
end

# brand#show
crumb :show_brand do |brand|
  link "#{brand.name}", brand
  parent :brands
end

# brand#edit
crumb :edit_brand do |brand|
  link "編集", edit_brand_path(brand)
  parent :show_brand, brand
end

# brand#new
crumb :new_brand do
  link "ブランド登録", new_brand_path
  parent :root
end

# ranking#like
crumb :ranking_like do
  link "お気に入りランキング", rankings_like_path
  parent :root
end

# login
crumb :login do
  link "ログイン", login_path
  parent :root
end

# toppage#contacts
crumb :contact do
  link "お問い合わせ", contacts_path
  parent :root
end

# toppage#privacy
crumb :policy do
  link "利用基準", policy_path
  parent :root
end

# toppage#privacypolicy
crumb :privacypolicy do
  link "プライバシーポリシー", privacypolicy_path
  parent :root
end
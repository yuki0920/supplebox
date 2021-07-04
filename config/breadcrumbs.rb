# frozen_string_literal: true

crumb :root do
  link 'Home', root_path
end

# user#show
crumb :show_user do
  link 'プロフィール'
end

# user#like_products
crumb :like_products do
  link 'お気に入りプロテイン一覧'
end

# user#edit
crumb :edit_user do
  link 'プロフィール編集'
  parent :show_user
end

# user#new
crumb :new_user do
  link '新規登録', signup_path
end

# product#index
crumb :products do
  link 'プロテイン一覧'
  parent :root
end

# product#show
crumb :show_product do
  link 'プロテイン詳細'
  parent :products
end

# product#new
crumb :new_product do
  link 'プロテイン登録', new_product_path
  parent :products
end

# post#index
crumb :posts do
  link '口コミ一覧', posts_path
  parent :root
end

# post#edit
crumb :edit_post do
  link '編集'
  parent :posts
end

# login
crumb :login do
  link 'ログイン', login_path
  parent :root
end

# toppage#contacts
crumb :contact do
  link 'お問い合わせ', contacts_path
  parent :root
end

# toppage#privacy
crumb :policy do
  link '利用基準', policy_path
  parent :root
end

# toppage#privacypolicy
crumb :privacypolicy do
  link 'プライバシーポリシー', privacypolicy_path
  parent :root
end

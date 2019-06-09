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
  link "@#{user.nickname}のプロフィール編集", edit_user_path(user)
  parent :show_user, user
end

# user#new
crumb :new_user do
  link "新規登録", new_user_path
  parent :users
end

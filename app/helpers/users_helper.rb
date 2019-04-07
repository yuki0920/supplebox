module UsersHelper
  def gravatar_url(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    #[retro]はデフォルトの画像を設定
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=retro"
  end
end
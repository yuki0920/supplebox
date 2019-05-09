class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [100, 100]
  
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end
  
  # アップロードファイルの保存先ディレクトリは上書き可能
  # 下記はデフォルトの保存先 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  # デフォルト画像の設定
  def default_url(*args)
    'default.png'
  end
  
   # アップロード可能な拡張子のリスト
  def extension_whitelist
    %w(jpg jpeg gif png)
  end 
end

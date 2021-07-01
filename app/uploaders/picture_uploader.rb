# frozen_string_literal: true

class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [400, 400]

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # アップロードファイルの保存先ディレクトリは上書き可能
  # 下記はデフォルトの保存先
  # テスト環境時のみ保存先を変更
  def store_dir
    if Rails.env.test?
      "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    else
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end

  # デフォルト画像の設定
  def default_url(*_args)
    'default.png'
  end

  # アップロード可能な拡張子のリスト
  def extension_allowlist
    %w[jpg jpeg gif png]
  end
end

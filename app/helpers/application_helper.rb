# frozen_string_literal: true

module ApplicationHelper
  def api_asset_path(object)
    asset_path = asset_path(object.picture_url)
    if Rails.env.production? && object.picture.file
      asset_path
    else
      File.join(ENV.fetch('API_URL', 'http://localhost:3001'), asset_path)
    end
  end

  # 日時をスラッシュ区切りで表示するメソッド
  def simple_time(time)
    time.strftime('%Y/%m/%d %H:%M')
  end
end

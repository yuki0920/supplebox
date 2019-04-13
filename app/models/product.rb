class Product
  # プロパティの設定
  attr_accessor :title, :image_url, :url , :asin

  def initialize(title, image_url, url, asin)
    @title = title
    @image_url = image_url
    @url = url
    @asin = asin
  end
end

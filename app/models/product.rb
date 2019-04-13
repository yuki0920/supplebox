class Product
  # プロパティの設定
  attr_accessor :title, :image_url, :url , :asin, :brand, :price

  def initialize(title, image_url, url, asin, brand, price)
    @title = title
    @image_url = image_url
    @url = url
    @asin = asin
    @brand = brand
    @price = price
  end
end

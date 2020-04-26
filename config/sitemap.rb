# frozen_string_literal: true

# サイトマップ作成対象のサイト（sitemap_generatorは複数のhostにも対応可能）
SitemapGenerator::Sitemap.default_host = 'https://supplebox.jp'

# サイトマップの出力先を指定
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}"

SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV['S3_BUCKET'],
  aws_access_key_id: ENV['S3_ACCESS_KEY'],
  aws_secret_access_key: ENV['S3_SECRET_KEY'],
  aws_region: ENV['S3_REGION'],
)

SitemapGenerator::Sitemap.create do
  # 'root'
  add root_path, priority: 1, changefreq: 'daily'
  # '/posts'
  add posts_path, priority: 0.9, changefreq: 'daily'
  # '/product/id'
  Product.find_each do |product|
    add product_path(product), lastmod: product.updated_at
  end
  # '/brand/id'
  Brand.find_each do |brand|
    add brand_path(brand), lastmod: brand.updated_at
  end
end

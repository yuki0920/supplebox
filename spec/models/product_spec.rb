require 'rails_helper'

RSpec.describe Product, type: :model do
  it '商品登録できること' do
    product = FactoryBot.create(:product)
    product.valid?
    expect(product).to be_valid
  end
  
  it 'アイテム名称がないと無効な状態であること' do
    product = FactoryBot.build(:product, title: nil)
    product.valid?
    expect(product.errors[:title]).to include('を入力してください')
  end
  
    it 'URLがないと無効な状態であること' do
    product = FactoryBot.build(:product, url: nil)
    product.valid?
    expect(product.errors[:url]).to include('を入力してください')
  end
  
  it '画像URLがないと無効な状態であること' do
    product = FactoryBot.build(:product, image_url: nil)
    product.valid?
    expect(product.errors[:image_url]).to include('を入力してください')
  end

    it 'アイテムコードがないと無効な状態であること' do
    product = FactoryBot.build(:product, asin: nil)
    product.valid?
    expect(product.errors[:asin]).to include('を入力してください')
  end
  
  it '重複したアイテムコードなら無効な状態であること' do
    FactoryBot.create(:product)
    product = FactoryBot.build(:product)
    product.valid?
    expect(product.errors[:asin]).to include('はすでに存在します')
  end

end

require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryBot.build(:product) }
  let(:other_product) { FactoryBot.build(:product) }
  
  it '商品登録できること' do
    expect(product).to be_valid
  end
  
  it 'アイテム名称がないと無効な状態であること' do
    product.title = nil
    product.valid?
    expect(product.errors[:title]).to include('を入力してください')
  end
  
    it 'URLがないと無効な状態であること' do
    product.url = nil
    product.valid?
    expect(product.errors[:url]).to include('を入力してください')
  end
  
  it '画像URLがないと無効な状態であること' do
    product.image_url = nil
    product.valid?
    expect(product.errors[:image_url]).to include('を入力してください')
  end

    it 'アイテムコードがないと無効な状態であること' do
    product.asin = nil
    product.valid?
    expect(product.errors[:asin]).to include('を入力してください')
  end
  
  it '重複したアイテムコードなら無効な状態であること' do
    product.asin = 'TESTPRODUCT1'
    product.save
    other_product.asin = 'TESTPRODUCT1'
    other_product.valid?
    expect(other_product.errors[:asin]).to include('はすでに存在します')
  end

end

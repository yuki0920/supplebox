require 'rails_helper'

RSpec.describe Brand, type: :model do
  
  let(:brand){ FactoryBot.create(:brand) }
  let(:product){ FactoryBot.create(:product) }
  
  describe 'ブランド作成が有効な場合' do
    it '新規登録できること' do
      brand = FactoryBot.build(:brand)
      brand.valid?
      expect(brand).to be_valid
    end
  end
  
  describe 'ブランドネームを検証する場合' do
    it 'ブランドネームが無いと無効な状態であること' do
      brand.name = nil
      brand.valid?
      expect(brand.errors[:name]).to include('を入力してください')
    end
  end
  
  describe 'ブランド内容を検証する場合' do
    it 'ブランド内容が無いと無効な状態であること' do
      brand.content = nil
      brand.valid?
      expect(brand.errors[:content]).to include('を入力してください')
    end
  end
end

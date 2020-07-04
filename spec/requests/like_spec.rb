require 'rails_helper'

RSpec.describe 'Like' do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  before do
    post login_path, params: { session: { email: user.email, password: 'password' } }
  end

  describe 'like' do
    it '通常の登録' do
      expect {
        post likes_path, params: { product_id: product.id }
      }.to change(Like, :count).by(1)
    end

    it '非同期の登録' do
      expect {
        post likes_path, xhr: true, params: { product_id: product.id }
      }.to change(Like, :count).by(1)
    end
  end

  describe 'unlike' do
    let!(:like) { user.likes.create!(product_id: product.id) }

    it '通常の削除' do
      expect {
        delete like_path(like), params: { product_id: product.id }
      }.to change(Like, :count).by(-1)
    end

    it '非同期の削除' do
      expect {
        delete like_path(like), xhr: true, params: { product_id: product.id }
      }.to change(Like, :count).by(-1)
    end
  end
end

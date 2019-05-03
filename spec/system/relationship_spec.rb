require 'rails_helper'

describe 'ユーザーフォロー機能', type: :system do
  
  let!(:user) { FactoryBot.create(:user) }
  let!(:other_user) { FactoryBot.create(:user) }

  context '他のユーザーをフォローしていない場合' do
    it 'フォローできること' do
      sign_in_as user
      visit user_path(other_user)
      expect {
        click_on "Follow"
      }.to change(Relationship, :count).by(1)
      expect(page).to have_content 'ユーザーをフォローしました。'
    end
  end

  context '他のユーザーをフォローしている場合' do
    before do
      sign_in_as user
      visit user_path(other_user)
      click_on "Follow"
    end
    it 'フォロー解除できること' do
      expect {
        click_on "Unfollow"
      }.to change(Relationship, :count).by(-1)
      expect(page).to have_content 'ユーザーのフォローを解除しました。'
    end
  end
end
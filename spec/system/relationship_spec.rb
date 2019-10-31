# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザーフォロー機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:other_user) { FactoryBot.create(:user) }

  context '他のユーザーをフォローしていない場合' do
    it 'フォローできること' do
      sign_in_as user
      visit user_path(other_user)
      expect do
        click_on 'フォローする'
      end.to change(Relationship, :count).by(1)
      # expect(page).to have_content 'ユーザーをフォローしました。'
    end
  end

  context '他のユーザーをフォローしている場合' do
    before do
      FactoryBot.create(:relationship, user: user, follow: other_user)
    end

    it 'ユーザーのフォロー状況が表示されていること' do
      visit followings_user_path(user)
      expect(page).to have_content other_user.name
    end

    it 'ユーザーのフォロー状況が表示されていること' do
      visit followers_user_path(other_user)
      expect(page).to have_content user.name
    end

    it 'フォロー解除できること' do
      sign_in_as user
      visit user_path(other_user)
      expect do
        click_on 'フォロー中'
      end.to change(Relationship, :count).by(-1)
      # expect(page).to have_content 'ユーザーのフォローを解除しました。'
    end
  end
end

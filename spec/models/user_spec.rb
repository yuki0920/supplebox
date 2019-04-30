require 'rails_helper'

RSpec.describe User, type: :model do
  it '新規登録できること' do
    user = User.new(
      name: 'Test',
      nickname: 'テスト',
      email: 'tester@supplebox.jp',
      password: 'tester',            
      )
      expect(user).to be_valid
  end
  
end

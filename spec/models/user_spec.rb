require 'rails_helper'

RSpec.describe User, type: :model do
  it '新規登録できること' do
      expect(FactoryBot.build(:user)).to be_valid
  end
  
  it 'ユーザー名が無いと新規登録できないこと' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include('を入力してください')
  end
  
  it 'ニックネームが無いと新規登録できないこと' do
    user = User.new(nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include('を入力してください')
  end
 
  it 'メールアドレスが無いと新規登録できないこと' do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include('を入力してください')
  end
  
  it '重複したメールアドレスなら無効な状態であること' do
    User.create(
      name: 'Test',
      nickname: 'テスト',
      email: 'tester@supplebox.jp',
      password: 'tester',            
      )
    user = User.new(
      name: 'Sample',
      nickname: 'テスト',
      email: 'tester@supplebox.jp',
      password: 'tester',            
      )
    user.valid?
    expect(user.errors[:email]).to include('はすでに存在します')
  end
  
end

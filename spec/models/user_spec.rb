require 'rails_helper'

RSpec.describe User, type: :model do
  it '新規登録できること' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
  
  it 'ユーザー名が無いと新規登録できないこと' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include('を入力してください')
  end
  
  it 'ニックネームが無いと新規登録できないこと' do
    user = FactoryBot.build(:user, nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include('を入力してください')
  end
 
  it 'メールアドレスが無いと新規登録できないこと' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include('を入力してください')
  end
  
  it '重複したメールアドレスなら無効な状態であること' do
    FactoryBot.create(:user)
    user = FactoryBot.build(:user)
    user.valid?
    expect(user.errors[:email]).to include('はすでに存在します')
  end
  
  it 'ユーザー名が50文字超なら無効な状態であること' do
    user = FactoryBot.build(:user, name: 'a' * 51 )
    user.valid?
    expect(user.errors[:name]).to include('は50文字以内で入力してください')
  end
  
  it 'ニックネームが50文字超なら無効な状態であること' do
    user = FactoryBot.build(:user, nickname: 'a' * 51 )
    user.valid?
    expect(user.errors[:nickname]).to include('は50文字以内で入力してください')
  end
  
  it 'メールアドレスに@が含まれていないなら無効な状態であること' do
    user = FactoryBot.build(:user, email: 'supplebox.jp' )
    user.valid?
    expect(user.errors[:email]).to include('は不正な値です')
  end
  
end

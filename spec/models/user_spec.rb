require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = User.new(nickname: nil, email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "mail-adressがない場合は登録できないこと" do
      user = User.new(nickname: "test", email: "nil", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
  end
end
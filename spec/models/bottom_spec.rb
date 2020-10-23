require 'rails_helper'
describe Bottom do
  describe '#create' do

    it "categoryがない場合は登録できないこと" do
      bottom = build(:bottom, category: nil)
      bottom.valid?
      expect(bottom.errors[:category]).to include("を入力してください")
    end
  end
end
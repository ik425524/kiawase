require 'rails_helper'
describe Topp do
  describe '#create' do

    it "categoryがない場合は登録できないこと" do
      topp = build(:topp, category: nil)
      topp.valid?
      expect(topp.errors[:category]).to include("を入力してください")
    end
  end
end
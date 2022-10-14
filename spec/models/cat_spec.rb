require 'rails_helper'

RSpec.describe Cat, type: :model do
  let(:cat){FactoryBot.build(:cat)}

  # バリデーション チェック
  describe "バリデーション検証" do
    subject {cat}

    context "名前が入力されている場合" do
      it "保存ができること" do
        is_expected.to be_valid
      end
    end
    
    context "名前が未入力の場合" do
      it "保存ができないこと" do
        # Nil
        cat.name = nil
        is_expected.to be_invalid

        # 空文字
        cat.name = ""
        is_expected.to be_invalid
      end
    end

    context "年齢が入力されている場合" do
      it "保存ができること" do
        is_expected.to be_valid
      end
    end
    
    context "年齢が入力されていない場合" do
      it "保存ができないこと" do
        # Nil
        cat.age = nil
        is_expected.to be_invalid

        # 空文字
        cat.age = ''
        is_expected.to be_invalid
      end
    end

    context "数値以外が入力された場合" do
      it "保存ができないこと" do
        cat.age = "18 years old"
        is_expected.to be_invalid
      end
    end
    
    context "数値が0より小さい場合" do
      it "保存ができないこと" do
        cat.age = -10
        is_expected.to be_invalid
      end
    end

  end

end

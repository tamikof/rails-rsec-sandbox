require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "バリデーション" do
    it "正常系" do
      post = FactoryBot.build(:post, title: "タイトル", body: "内容")
      expect(post).to be_valid
    end

    it "タイトルがなければ無効" do
      post = FactoryBot.build(:post, title: nil)
      expect(post).not_to be_valid
    end

    it "bodyがなければ無効である" do
      post = FactoryBot.build(:post, body: nil)
      expect(post).not_to be_valid
    end
  end
end

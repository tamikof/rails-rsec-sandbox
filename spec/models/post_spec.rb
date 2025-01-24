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

  describe "#admin_draft?" do
    it "管理者かつ下書きの場合はtrueを返す" do
      expect(FactoryBot.build(:post, :admin, :draft).admin_draft?).to be true
    end

    it "一般かつ下書きの場合はfalseを返す" do
      expect(FactoryBot.build(:post, :general, :draft).admin_draft?).to be false
    end

    it "管理者かつ公開の場合はfalseを返す" do
      expect(FactoryBot.build(:post, :admin, :published).admin_draft?).to be false
    end

    it "一般かつ公開の場合はfalseを返す" do
      expect(FactoryBot.build(:post, :general, :published).admin_draft?).to be false
    end

    it "管理者かつアーカイブの場合はfalseを返す" do
      expect(FactoryBot.build(:post, :admin, :archived).admin_draft?).to be false
    end

    it "一般かつアーカイブの場合はfalseを返す" do
      expect(FactoryBot.build(:post, :general, :archived).admin_draft?).to be false
    end
  end
end

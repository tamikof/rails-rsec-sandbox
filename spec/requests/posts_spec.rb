require 'rails_helper'

RSpec.describe "/posts", type: :request do
  describe "GET /index" do
    let!(:post) { FactoryBot.create(:post) }

    it "successfulを返すこと" do
      get posts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let!(:post) { FactoryBot.create(:post) }

    it "successfulを返すこと" do
      get post_url(post)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "successfulを返すこと" do
      get new_post_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    let!(:post) { FactoryBot.create(:post) }

    it "successfulを返すこと" do
      get edit_post_url(post)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let!(:valid_attributes) { { title: 'test', body: 'body' } }

      it "Postを一件追加すること" do
        expect {
          post posts_url, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "詳細ページにリダイレクトすること" do
        post posts_url, params: { post: valid_attributes }
        expect(response).to redirect_to(post_url(Post.last))
      end
    end

    context "バリデーションエラー" do
      let!(:invalid_attributes) { { title: nil, body: 'body' } }

      it "Postを追加しないこと" do
        expect {
          post posts_url, params: { post: invalid_attributes }
        }.to change(Post, :count).by(0)
      end

      it "unprocessable_entityを返すこと" do
        post posts_url, params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "下書きかつ正常系" do
      let(:new_attributes) {
        { title: 'update', body: 'update body' }
      }

      let!(:post) { FactoryBot.create(:post, :draft) }

      it "Postを更新すること" do
        patch post_url(post), params: { post: new_attributes }
        post.reload
        expect(post.title).to eq('update')
        expect(post.body).to eq('update body')
      end

      it "詳細にページにリダイレクトすること" do
        patch post_url(post), params: { post: new_attributes }
        expect(response).to redirect_to(post_url(post))
      end
    end

    context "下書きだけどバリデーションエラー発生" do
      let!(:post) { FactoryBot.create(:post, :draft) }
      let!(:invalid_attributes) { { title: nil, body: 'body' } }

      it "unprocessable_entityを返すこと" do
        patch post_url(post), params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "公開済み" do
      let!(:post) { FactoryBot.create(:post, :published) }
      let!(:valid_attributes) { { title: 'test', body: 'body' } }

      it "not_foundを返すこと" do
        patch post_url(post), params: { post: valid_attributes }
        expect(response).to have_http_status(:not_found)
      end
    end

    context "アーカイブ済み" do
      let!(:post) { FactoryBot.create(:post, :archived) }
      let!(:valid_attributes) { { title: 'test', body: 'body' } }

      it "not_foundを返すこと" do
        patch post_url(post), params: { post: valid_attributes }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:post) { FactoryBot.create(:post) }

    it "Postを削除すること" do
      expect {
        delete post_url(post)
      }.to change(Post, :count).by(-1)
    end

    it "一覧ページにリダイレクトすること" do
      delete post_url(post)
      expect(response).to redirect_to(posts_url)
    end
  end
end

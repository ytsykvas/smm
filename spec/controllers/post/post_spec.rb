require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET index action" do
    it "displays the list of posts" do
      post1 = FactoryBot.create(:post)
      post2 = FactoryBot.create(:post)
      get posts_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(post1.title)
      expect(response.body).to include(post2.title)
    end
  end

  describe "GET show action" do
    it "displays a specific post" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post)
      sign_in user
      get post_path(post)
      expect(response).to have_http_status(200)
      expect(response.body).to include(post.title)
    end
  end

  describe "POST create action" do
    it "creates a new post" do
      post_params = { post: { title: "New Post", body: "This is a new post." } }
      post posts_path, params: post_params
      expect(response).to redirect_to(posts_path)
      expect(Post.last.title).to eq("New Post")
    end
  end

  describe "PATCH /posts/:id" do
    let(:post) { FactoryBot.create(:post) }

    context "with valid params" do
      it "updates the post" do
        updated_title = "Updated Title"
        updated_body = "Updated Body"

        patch post_path(post), params: { post: { title: updated_title, body: updated_body } }
        post.reload
        expect(post.title).to eq(updated_title)
        expect(post.body).to eq(updated_body)
        expect(response).to redirect_to(post_path(post))
        expect(flash[:notice]).to eq(I18n.t('posts.post_is_updated'))
      end
    end

    context "with invalid TITLE params" do
      it "renders the edit form with a notice" do
        invalid_title = "1"
        valid_body = "Some text in body. Seems to be valid."

        patch post_path(post), params: { post: { title: invalid_title, body: valid_body } }

        post.reload
        expect(post.title).not_to eq(invalid_title)
        expect(post.body).not_to eq(valid_body)
        expect(response).to render_template(:edit)
        expect(response.body).to include('Перевірте поля')
      end
    end

    context "with invalid BODY params" do
      it "renders the edit form with a notice" do
        valid_title = "Some text"
        invalid_body = "2"

        patch post_path(post), params: { post: { title: valid_title, body: invalid_body } }

        post.reload
        expect(post.title).not_to eq(valid_title)
        expect(post.body).not_to eq(invalid_body)
        expect(response).to render_template(:edit)
        expect(response.body).to include('Перевірте поля')
      end
    end
  end
end

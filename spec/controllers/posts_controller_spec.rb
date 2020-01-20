require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { User.create({ first_name: 'Jonathan', last_name: 'Palma', email: 'jonathan@gmail.com', password: "123456" }) }

  describe "GET /new " do
    it "responds with 200" do
      get :new, params: { id: user.id }, session: { id: user.id }
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }, session: { id: user.id, return_to: posts_path }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      post :create, params: { post: { message: "Hello, world!" } }, session: { id: user.id, return_to: posts_path }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index, session: { id: user.id }
      expect(response).to have_http_status(200)
    end
  end
end

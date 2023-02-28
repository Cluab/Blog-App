require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /index' do
    it 'returns the index templete' do
      get user_posts_path(user_id: 1)
      expect(response).to render_template(:index)
    end
    it 'returns http success' do
      get user_posts_path(user_id: 1)
      expect(response).to have_http_status(:success)
    end
    it 'includes the correct placeholder text in the response body' do
      get user_posts_path(user_id: 1)
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
  describe 'GET /show' do
    it 'returns the show template' do
      user = User.create(name: 'John Doe')
      post = Post.create(title: 'New Post', text: 'Lorem ipsum', author_id: user.id)
      get user_post_path(id: post.id, user_id: user.id)
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
      expect(response.body).to include(post.title)
    end
  end
end

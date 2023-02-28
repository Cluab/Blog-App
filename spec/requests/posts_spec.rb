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
end

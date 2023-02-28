require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get user_posts_path(user_id: 1)
      expect(response).to have_http_status(:success)
    end
  end
end

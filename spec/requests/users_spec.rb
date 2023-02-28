require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index' do
    it 'returns the index templete' do
      get users_path
      expect(response).to render_template(:index)
    end
    it 'returns http success' do
      get users_path
      expect(response).to have_http_status(:success)
    end
    it 'includes the correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('Here is a list of users names')
    end
  end

  describe 'GET /show' do
    before do
      @user = User.create(name: 'John Doe')
    end

    it 'returns the show template' do
      get user_path(id: @user.id)
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
      expect(response.body).to include(@user.name)
    end
  end
end

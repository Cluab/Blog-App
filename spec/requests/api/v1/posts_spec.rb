require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
  fixtures :all

  path '/api/users/{user_id}/posts' do
    parameter name: 'user_id', in: :path, type: :string, description: 'User id'
    let(:user_id) { users(:user1).id }

    get('list posts') do
      produces 'application/json'

      response(200, 'Returns all posts created by a given user.') do
        schema type: :array,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :string },
                 comments_counter: { type: :integer },
                 likes_counter: { type: :integer },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 author_id: { type: :integer }
               }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end
end
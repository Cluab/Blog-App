require 'rails_helper'
require 'swagger_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'api/comments', type: :request do
  fixtures :all

  path '/api/users/{user_id}/posts/{post_id}/comments' do
    parameter name: 'user_id', in: :path, type: :integer, description: 'User id'
    parameter name: 'post_id', in: :path, type: :integer, description: 'Post id'

    get('list comments') do
      response(200, 'successful') do
        let(:user_id) { users(:user1).id }
        let(:post_id) { posts(:post1).id }

        schema type: :array,
               properties: {
                 id: { type: :integer },
                 text: { type: :string },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 author_id: { type: :integer },
                 post_id: { type: :integer }
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

    post('create comment') do
      consumes 'application/json'
      produces 'application/json'

      let(:comment) { { text: 'My first comment' } }

      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: %i[comment text]
      }

      response(201, 'successful') do
        let(:user_id) { users(:user1).id }
        let(:post_id) { posts(:post1).id }

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
# rubocop:enable Metrics/BlockLength

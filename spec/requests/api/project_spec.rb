require 'swagger_helper'

RSpec.describe 'api/project', type: :request do
  path '/projects' do
    post 'Creates a project' do
      tags 'Projects'
      consumes 'application/json'
      produces 'application/json'
      #headers {'HTTP_ACCEPT' : "application/json"}
          parameter name: :project, in: :body, schema: {
            type: :object,
            properties: {
              user_id: { type: :integer },
              short_title: { type: :string },
              title: { type: :string }
            },
            required: [ 'short_title', 'title' ]
          }        
    
          response '201', 'project created' do
            let(:project) { { user_id: 1, short_title: 'foo', title: 'bar' } }
            run_test!
          end
    
          response '422', 'invalid request' do
            let(:project) { { short_title: 'foo' } }
            run_test!
          end
        end
      end
end

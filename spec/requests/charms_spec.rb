require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'Charms API', type: :request do
  include Support::RequestHelpers

  path '/charms' do
    get 'Lists all charms' do
      produces 'application/json'
      tags 'charms'
      description 'Returns all charms'
      response '200', 'Successful' do
        before do
          create_list(:charm, 5)
        end

        run_test! do |response|
          expect(response.code).to eq('200')
          expect(response_body.length).to eq(5)
        end
      end
    end
  end
end

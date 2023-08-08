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

    post 'Creates a charm' do
      consumes 'application/json'
      produces 'application/json'
      tags 'charms'
      description 'Creates a charm'
      parameter name: :charm, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          school: { type: :string },
          percentage: { type: :integer }
        },
        required: %w[name percentage]
      }
      response '201', 'Created' do
        let(:charm) { build(:charm) }

        run_test! do |response|
          expect(response.code).to eq('201')
          expect(response_body['name']).to eq(charm.name)
        end
      end

      response '422', 'Unprocessable Entity' do
        let(:charm) { build(:charm, name: nil) }

        run_test! do |response|
          expect(response.code).to eq('422')
          expect(response_body['name']).to include("can't be blank")
        end
      end
    end
  end

  path '/charms/{id}' do
    get 'Shows a charm' do
      produces 'application/json'
      tags 'charms'
      description 'Shows a charm'
      parameter name: :id, in: :path, type: :integer
      response '200', 'Successful' do
        let(:charm) { create(:charm) }
        let(:id) { charm.id }

        run_test! do |response|
          expect(response.code).to eq('200')
          expect(response_body['id']).to eq(charm.id)
        end
      end

      response '404', 'Not Found' do
        let(:id) { 0 }

        run_test! do |response|
          expect(response.code).to eq('404')
          expect(response_body['error']).to include('Couldn\'t find Charm')
        end
      end
    end

    put 'Updates a charm' do
      consumes 'application/json'
      produces 'application/json'
      tags 'charms'
      description 'Updates a charm'
      parameter name: :id, in: :path, type: :integer
      parameter name: :charm_params, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          school: { type: :string },
          percentage: { type: :integer }
        }
      }
      response '200', 'Successful' do
        let(:charm) { create(:charm) }
        let(:id) { charm.id }
        let(:charm_params) { attributes_for(:charm) }

        run_test! do |response|
          expect(response.code).to eq('200')
          expect(response_body['name']).to eq(charm_params[:name])
        end
      end

      response '422', 'Unprocessable Entity' do
        let(:charm) { create(:charm) }
        let(:id) { charm.id }
        let(:charm_params) { attributes_for(:charm, name: nil) }

        run_test! do |response|
          expect(response.code).to eq('422')
          expect(response_body['name']).to include("can't be blank")
        end
      end
    end

    delete 'Deletes a charm' do
      produces 'application/json'
      tags 'charms'
      description 'Deletes a charm'
      parameter name: :id, in: :path, type: :integer
      response '204', 'Successful' do
        let(:charm) { create(:charm) }
        let(:id) { charm.id }

        run_test! do |response|
          expect(response.code).to eq('204')
          expect(Charm.count).to eq(0)
        end
      end

      response '404', 'Not Found' do
        let(:id) { 0 }

        run_test! do |response|
          expect(response.code).to eq('404')
          expect(response_body['error']).to include('Couldn\'t find Charm')
        end
      end
    end
  end
end

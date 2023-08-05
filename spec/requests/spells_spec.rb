require 'swagger_helper'
require 'rails_helper'

describe 'Spells API' do
  include Support::RequestHelpers

  path '/spells' do
    get 'Lists all spells' do
      produces 'application/json'
      tags 'spells'
      description 'Returns all spells'
      response '200', 'Successful' do
        before do
          create_list(:spell, 5)
        end

        run_test! do |response|
          expect(response.code).to eq('200')
          expect(response_body.length).to eq(5)
        end
      end
    end

    post 'Creates a spell' do
      consumes 'application/json'
      produces 'application/json'
      tags 'spells'
      description 'Creates a spell'
      parameter name: :spell, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          pips: { type: :integer },
          school: { type: :string },
          accuracy: { type: :integer },
          damage: { type: :integer }
        },
        required: %w[name pips school accuracy damage]
      }
      response '201', 'Created' do
        let(:spell) { build(:spell) }

        run_test! do |response|
          expect(response.code).to eq('201')
          expect(response_body['name']).to eq(spell.name)
        end
      end

      response '422', 'Unprocessable Entity' do
        let(:spell) { build(:spell, name: nil) }

        run_test! do |response|
          expect(response.code).to eq('422')
          expect(response_body['name']).to include("can't be blank")
        end
      end
    end
  end

  path '/spells/{id}' do
    get 'Gets spell by ID' do
      produces 'application/json'
      tags 'spells'
      description 'Retrieves a spell by ID'
      parameter name: :id, in: :path, type: :integer
      response '200', 'Successful' do
        let(:spell) { create(:spell) }
        let(:id) { spell.id }

        run_test! do |response|
          expect(response.code).to eq('200')
          expect(response_body['name']).to eq(spell.name)
          expect(response_body['damage']).to eq(spell.damage)
        end
      end

      response '404', 'Not Found' do
        let(:id) { 0 }

        run_test! do |response|
          expect(response.code).to eq('404')
          expect(response_body['error']).to include('Couldn\'t find Spell')
        end
      end
    end

    put 'Updates a spell' do
      consumes 'application/json'
      produces 'application/json'
      tags 'spells'
      description 'Updates a spell'
      parameter name: :id, in: :path, type: :integer
      parameter name: :spell_params, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          pips: { type: :integer },
          school: { type: :string },
          accuracy: { type: :integer },
          damage: { type: :integer }
        }
      }
      response '200', 'Successful' do
        let(:spell) { create(:spell) }
        let(:id) { spell.id }
        let(:spell_params) { attributes_for(:spell) }

        run_test! do |response|
          expect(response.code).to eq('200')
          expect(response_body['name']).to eq(spell_params[:name])
        end
      end

      response '422', 'Unprocessable Entity' do
        let(:spell) { create(:spell) }
        let(:id) { spell.id }
        let(:spell_params) { attributes_for(:spell, name: nil) }

        run_test! do |response|
          expect(response.code).to eq('422')
          expect(response_body['name']).to include("can't be blank")
        end
      end
    end

    delete 'Deletes a spell' do
      produces 'application/json'
      tags 'spells'
      description 'Deletes a spell'
      parameter name: :id, in: :path, type: :integer
      response '204', 'No Content' do
        let(:spell) { create(:spell) }
        let(:id) { spell.id }

        run_test! do |response|
          expect(response.code).to eq('204')
          expect(Spell.count).to eq(0)
        end
      end

      response '404', 'Not Found' do
        let(:id) { 0 }

        run_test! do |response|
          expect(response.code).to eq('404')
          expect(response_body['error']).to include('Couldn\'t find Spell')
        end
      end
    end
  end
end

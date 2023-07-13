require 'swagger_helper'
require 'rails_helper'

describe 'Spells API' do
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
          json_response = JSON.parse(response.body)
          expect(json_response).to be_an(Array)
          expect(json_response.length).to eq(5)
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
          json_response = JSON.parse(response.body)
          expect(json_response['name']).to eq(spell.name)
          expect(json_response['damage']).to eq(spell.damage)
        end
      end
    end
  end
end

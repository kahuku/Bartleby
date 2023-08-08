require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'Attack API', type: :request do
  include Support::RequestHelpers

  path '/calculate_damage' do
    post 'Calculates damage' do
      consumes 'application/json'
      produces 'application/json'
      tags 'attack'
      description 'Calculates damage'

      parameter name: :attack_params, in: :body, schema: {
        type: :object,
        properties: {
          spell_id: { type: :integer },
          charm_ids: { type: :array, items: { type: :integer } },
          opponent_health: { type: :integer }
        },
        required: %w[spell_id charm_ids opponent_health]
      }

      response '200', 'Successful' do
        let(:spell) { create(:spell, damage: 10) }
        let(:charm) { create(:charm, percentage: 10) }
        let(:blank_charm) { create(:charm, percentage: 0) }
        let(:attack_params) do
          {
            spell_id: spell.id,
            charm_ids: [charm.id, blank_charm.id],
            opponent_health: 100
          }
        end

        run_test! do |response|
          expect(response.code).to eq('200')
          expect(response_body['total_damage']).to eq(11)
        end
      end

      response '422', 'Unprocessable Entity' do
        let(:spell) { create(:spell, damage: 10) }
        let(:charm) { create(:charm, percentage: 10) }
        let(:attack_params) do
          {
            spell_id: spell.id,
            charm_ids: [charm.id],
            opponent_health: nil
          }
        end

        run_test! do |response|
          expect(response.code).to eq('422')
          expect(response_error).to include('Missing parameters')
        end
      end
    end
  end
end

require 'rails_helper'

RSpec.describe AttackController, type: :controller do
  include Support::RequestHelpers

  describe 'POST #calculate_damage' do
    it 'returns a successful response' do
      spell = create(:spell, damage: 10)
      charm = create(:charm, percentage: 10)
      opponent_health = 100
      post :calculate_damage, params: {
        spell_id: spell.id,
        charm_ids: [charm.id],
        opponent_health: opponent_health
      }
      expect(response).to be_successful
      expect(response_body['total_damage']).to eq(11)
    end
  end
end

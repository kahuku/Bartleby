require 'rails_helper'

RSpec.describe SpellsController, type: :controller do
  include Support::RequestHelpers

  describe 'GET #index' do
    it 'returns a successful response' do
      create_list(:spell, 10)
      get :index
      expect(response).to be_successful
      expect(response_body.length).to eq(10)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      # Replace :id with a valid spell ID
      spell = create(:spell)
      get :show, params: { id: spell.id }
      expect(response).to be_successful
      expect(response_body['id']).to eq(spell.id)
    end
  end
end

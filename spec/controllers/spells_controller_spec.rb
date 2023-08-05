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
      spell = create(:spell)
      get :show, params: { id: spell.id }
      expect(response).to be_successful
      expect(response_body['id']).to eq(spell.id)
    end
  end

  describe 'POST #create' do
    it 'returns a successful response' do
      spell_attributes = attributes_for(:spell)
      post :create, params: { spell: spell_attributes }
      expect(response).to be_successful
      expect(response_body['name']).to eq(spell_attributes[:name])
    end
  end

  describe 'PUT #update' do
    it 'returns a successful response' do
      spell = create(:spell)
      spell_attributes = attributes_for(:spell)
      put :update, params: { id: spell.id, spell: spell_attributes }
      expect(response).to be_successful
      expect(response_body['name']).to eq(spell_attributes[:name])
    end
  end

  describe 'DELETE #destroy' do
    it 'returns a successful response' do
      spell = create(:spell)
      delete :destroy, params: { id: spell.id }
      expect(response).to be_successful
      expect(Spell.count).to eq(0)
    end
  end
end

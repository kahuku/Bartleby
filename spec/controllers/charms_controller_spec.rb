require 'rails_helper'

RSpec.describe CharmsController, type: :controller do
  include Support::RequestHelpers

  describe 'GET #index' do
    it 'returns a successful response' do
      create_list(:charm, 10)
      get :index
      expect(response).to be_successful
      expect(response_body.length).to eq(10)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      charm = create(:charm)
      get :show, params: { id: charm.id }
      expect(response).to be_successful
      expect(response_body['id']).to eq(charm.id)
    end
  end

  describe 'POST #create' do
    it 'returns a successful response' do
      charm_attributes = attributes_for(:charm)
      post :create, params: { charm: charm_attributes }
      expect(response).to be_successful
      expect(response_body['name']).to eq(charm_attributes[:name])
    end
  end
end

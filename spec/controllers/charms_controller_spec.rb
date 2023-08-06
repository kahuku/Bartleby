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
end

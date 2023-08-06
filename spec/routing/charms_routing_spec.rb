require 'rails_helper'

RSpec.describe 'Charm routing', type: :routing do
  it 'routes GET /charms to charms#index' do
    expect(get: '/charms').to route_to('charms#index')
  end
end

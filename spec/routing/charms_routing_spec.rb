require 'rails_helper'

RSpec.describe 'Charm routing', type: :routing do
  it 'routes GET /charms to charms#index' do
    expect(get: '/charms').to route_to('charms#index')
  end

  it 'routes GET /charms/:id to charms#show' do
    expect(get: '/charms/1').to route_to('charms#show', id: '1')
  end

  it 'routes POST /charms to charms#create' do
    expect(post: '/charms').to route_to('charms#create')
  end

  it 'routes PUT /charms/:id to charms#update' do
    expect(put: '/charms/1').to route_to('charms#update', id: '1')
  end
end

require 'rails_helper'

RSpec.describe 'Spell routing', type: :routing do
  it 'routes GET /spells to spells#index' do
    expect(get: '/spells').to route_to('spells#index')
  end

  it 'routes GET /spells/:id to spells#show' do
    expect(get: '/spells/1').to route_to('spells#show', id: '1')
  end

  it 'routes POST /spells to spells#create' do
    expect(post: '/spells').to route_to('spells#create')
  end

  it 'routes PUT /spells/:id to spells#update' do
    expect(put: '/spells/1').to route_to('spells#update', id: '1')
  end

  it 'routes DELETE /spells/:id to spells#destroy' do
    expect(delete: '/spells/1').to route_to('spells#destroy', id: '1')
  end
end

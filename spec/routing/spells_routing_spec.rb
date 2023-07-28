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
end

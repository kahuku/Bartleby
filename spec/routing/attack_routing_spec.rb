require 'rails_helper'

RSpec.describe 'Attack routing', type: :routing do
  it 'routes POST /calculate_damage to attack#calculate_damage' do
    expect(post: '/calculate_damage').to route_to('attack#calculate_damage')
  end
end

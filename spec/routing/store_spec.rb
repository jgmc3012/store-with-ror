require 'rails_helper'

describe 'Store paths' do
  it 'Retrieve a store looking by id' do
    expect(get: '/v1/stores/1/').to route_to(
      format: 'json',
      controller: 'v1/stores',
      action: 'show',
      id: '1'
    )
  end
end

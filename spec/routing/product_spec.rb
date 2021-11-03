require 'rails_helper'

describe 'Products paths' do
  it 'Create Products' do
    expect(post: '/v1/products/').to route_to(
      format: 'json',
      controller: 'v1/products',
      action: 'create'
    )
  end
end

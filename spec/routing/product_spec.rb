require 'rails_helper'

describe 'Products paths' do
  it 'Create Products' do
    expect(post: '/v1/products/').to route_to(
      format: 'json',
      controller: 'v1/products',
      action: 'create'
    )
  end
  it 'Update Products' do
    expect(put: '/v1/products/1').to route_to(
      format: 'json',
      controller: 'v1/products',
      action: 'update',
      id: '1'
    )
  end
  it 'Index Products' do
    expect(get: '/v1/products/').to route_to(
      format: 'json',
      controller: 'v1/products',
      action: 'index'
    )
  end
  it 'Delete Products' do
    expect(delete: '/v1/products/1').to route_to(
      format: 'json',
      controller: 'v1/products',
      action: 'destroy',
      id: '1'
    )
  end
  it 'Restore Products' do
    expect(post: '/v1/products/1/restore').to route_to(
      format: 'json',
      controller: 'v1/products',
      action: 'restore',
      product_id: '1'
    )
  end
end

require 'rails_helper'

describe 'Users paths' do
  it 'register user' do
    expect(post: '/v1/users/').to route_to(
      format: 'json',
      controller: 'v1/users',
      action: 'create',
    )
  end
  it 'Login to user' do
    expect(post: '/v1/users/login').to route_to(
      format: 'json',
      controller: 'v1/users',
      action: 'login',
    )
  end
end

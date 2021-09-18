require 'rails_helper'

describe 'Users paths' do
  it 'register user' do
    expect(post: '/v1/users/').to route_to(
      format: 'json',
      controller: 'v1/users',
      action: 'create',
    )
  end
end

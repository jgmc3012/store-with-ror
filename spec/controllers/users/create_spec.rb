require 'rails_helper'
RSpec.describe V1::UsersController, type: :controller do
  describe 'User register' do
    context 'successful' do
      let(:user_params) do
        {
          email: Faker::Internet.email,
          password: Faker::Internet.password,
          birthdate: '200-01-01',
          store_attributes: {
            name: Faker::Games::Zelda.game,
          }
        }
      end
      before { post(:create, params: user_params) }
      context 'status code is created' do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context 'validate response body' do
        subject { payload_test }
        it { is_expected.to include(:id, :email, :birthdate, :store, :token) }
      end
      context 'response with correct store values' do
        subject { payload_test[:store] }
        it { is_expected.to include(:id, :name, :created_at, :updated_at) }
      end

      context 'response with correct token values' do
        subject { payload_test[:token] }
        it { is_expected.to include(:expires_at, :token) }
      end
      
    end

    context 'bad request' do
      let(:user_params) { { email: '', password: '12345', birthdate: '200-01-01' } }

      before { post(:create, params: user_params) }
      context 'status code is bad_request' do
        subject { response }
        it { is_expected.to have_http_status(:bad_request) }
      end
      context 'error message in the payload' do
        subject { payload_test }
        it { is_expected.to eq({error: 'Invalid user'}) }
      end
    end

  end
end

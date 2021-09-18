require "rails_helper"
RSpec.describe V1::UsersController, type: :controller do
  describe "User register" do
    let(:user_params) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
      }
    end
    context "successful" do
      before do
        post(:create, params: { user: user_params })
      end
      context "status code is created" do
        subject { response.status }
        it { is_expected.to eq(:created) }
      end
      context "validate response body" do
		subject { payload_test }
		it { is_expected.to include(:id) }
		it { is_expected.to include(:email => user_params[:email]) }
		it { is_expected.to include(:birthdate => user_params[:birthdate]) }
      end
    end
  end
end

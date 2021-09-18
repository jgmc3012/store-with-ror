require "rails_helper"
RSpec.describe V1::UsersController, type: :controller do
  describe "User register" do
    let(:user_params) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        birthdate: "200-01-01",
      }
    end
    context "successful" do
      before do
        post(:create, params: user_params)
      end
      context "status code is created" do
        subject { response }
        it { is_expected.to have_http_status(:created) }
      end
      context "validate response body" do
        subject { payload_test }
        it { is_expected.to include(:id, :email, :birthdate) }
      end
    end
  end
end

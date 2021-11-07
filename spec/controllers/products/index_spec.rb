require 'rails_helper'

RSpec.describe V1::ProductsController, type: :controller do
  describe 'index products' do
    let(:user) { create(:owner) }
    let(:token) { create(:token, user: user) }
    let(:headers) { { 'Authorization' => "Bearer #{token.token}" } }
    let!(:products) { create_list(:product, 5, store: user.store) }

    context "get a product list successfull" do
      before do
        request.headers.merge!(headers)
        get :index
      end
      
      context "status 200 OK" do
        subject { response } 
        it { is_expected.to have_http_status(200) }
      end

      context "response body" do
        subject { payload_test.count }
        it { is_expected.to be 5 }
      end
    end

    context "try to get a list without token" do
      before do
        get :index
      end
      context "status 401 Unauthorized" do
        subject { response } 
        it { is_expected.to have_http_status(:unauthorized) }
      end
    end
  end
end
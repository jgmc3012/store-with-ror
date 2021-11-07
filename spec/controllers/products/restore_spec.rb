require 'rails_helper'

RSpec.describe V1::ProductsController, type: :controller do
  describe "Restore a product" do
    let(:user) { create(:owner) }
    let(:token) { create(:token, user: user) }
    let(:headers) { { 'Authorization' => "Bearer #{token.token}" } }
    let(:product) { create(:product, store: user.store) }
    let!(:destroy_product) { product.destroy }

    context "Restore success - status 200" do
      before do
        request.headers.merge!(headers)
        post :restore, params: { product_id: product.id }
      end
      subject { response }
      it { is_expected.to have_http_status(200) }

      it 'validate response' do
        expect(payload_test).to include(:id, :name, :description, :store_id, :created_at, :updated_at)
      end
    end

    context "Restore fail - status 401 unauthorized" do
      before do
        post :restore, params: { product_id: product.id }
      end
      subject { response }
      it { is_expected.to have_http_status(:unauthorized) }
    end
  end
  
end
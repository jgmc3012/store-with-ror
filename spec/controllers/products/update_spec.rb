require 'rails_helper'

RSpec.describe V1::ProductsController, type: :controller do
  describe 'Update Product' do
    let(:user) { create(:owner) }
    let(:token) { create(:token, user: user) }
    let(:headers) { { 'Authorization' => "Bearer #{token.token}" } }
    let(:product) { create(:product, store: user.store) }

    context 'update success' do
      before do
        request.headers.merge!(headers)
        put :update, format: :json, params: { id: product.id, name: 'new name' }
      end
      context 'response with status 200' do
        subject { response } 
        it { expect(response).to have_http_status(200) }
      end
      context 'response with correct format product' do
        subject { payload_test }
        it { is_expected.to include(:id, :price, :description, :name, :store_id) }
      end
    end
    
    context 'update fail' do
      before do
        request.headers.merge!(headers)
        put :update, format: :json, params: { id: product.id, name: "" }
      end
      context 'response with status 400' do
        subject { response } 
        it { expect(response).to have_http_status(:bad_request) }
      end
      context 'response with correct format error' do
        subject { payload_test }
        it { is_expected.to include(:errors) }
      end
    end

    context 'update without token' do
      before do
        put :update, format: :json, params: { id: product.id, name: 'new name' }
      end
      context 'response with status 401' do
        subject { response } 
        it { expect(response).to have_http_status(:unauthorized) }
      end
    end
  end
end
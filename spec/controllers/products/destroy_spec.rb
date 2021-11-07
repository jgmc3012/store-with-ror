require 'rails_helper'

RSpec.describe V1::ProductsController, type: :controller do
  describe "Destroy a product" do
    let(:user) { create(:owner) }
    let(:token) { create(:token, user: user) }
    let(:headers) { { 'Authorization' => "Bearer #{token.token}" } }
    let(:product) { create(:product, store: user.store) }

    context "Destroy success - status 204 not_content" do
      before do
        request.headers.merge!(headers)
        delete :destroy, params: { id: product.id }
      end
      subject { response }
      it { is_expected.to have_http_status(:no_content) }
      
    end

    context "Destroy fail - status 401 unauthorized" do
      before do
        delete :destroy, params: { id: product.id }
      end
      subject { response }
      it { is_expected.to have_http_status(:unauthorized) }
    end
  end
  
end
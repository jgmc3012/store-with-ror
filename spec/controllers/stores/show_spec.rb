require 'rails_helper'

RSpec.describe V1::StoresController, type: :controller do
    let(:user) { create(:owner) }
    let(:token) { create(:token, user: user) }
    let(:headers) { { 'Authorization' => "Bearer #{token.token}" } }
    context 'consult store by id' do
        before do
            request.headers.merge! headers
            get(:show, format: :json, params: { id: user.store.id })
        end
        it 'returns status 200 OK' do
            expect(response).to have_http_status(:success)
        end
        it 'structure correct' do
            expect(payload_test).to include(:id, :name)
        end
        
    end
    context "Dont have consult the other user's store" do
        let(:other_user) { create(:owner) }
        before do
            request.headers.merge! headers
            get(:show, format: :json, params: { id: other_user.store.id })
        end
        it 'returns status 401 OK' do
            expect(response).to have_http_status(:unauthorized)
        end
        it 'structure correct' do
            expect(payload_test).to include(:error)
        end
    end
    context "Dont have consult the other user's store" do
        before do
             get(:show, format: :json, params: { id: user.store.id }) 
        end
        it 'returns status 401 OK' do
            expect(response).to have_http_status(:unauthorized)
        end
        it 'structure correct' do
            expect(payload_test).to include(:error)
        end
    end
end
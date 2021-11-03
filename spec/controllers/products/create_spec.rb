require 'rails_helper'

RSpec.describe V1::ProductsController, type: :controller do
    describe 'POST #create' do
        let(:user) { create(:owner) }
        let(:token) { create :token, user: user }
        let(:headers) { { 'Authorization' => "Bearer #{token.token}" } }
        let(:product) { 
            {
                store_id: user.store.id,
                name: Faker::Book.title,
                description: Faker::Lorem.sentence(word_count: 50),
                price: rand(1..1000),
            }
        }
        context 'Register success' do
            before do
                request.headers.merge! headers
                post :create, params: product
            end
            context 'Status code 201 Created' do
                subject { response }
                it { is_expected.to have_http_status(:created) }
            end
            context 'Estructure validate for response' do
                subject { payload_test }
                it { is_expected.to include(:id, :name, :description, :store_id, :created_at, :updated_at) }
            end
        end

        context 'Register Failed' do
            before do
                product.name = ''
                request.headers.merge! headers
                post :create, params: product
            end
            context 'Status code 400 Bad Request' do
                subject { response }
                it { is_expected.to have_http_status(:bad_request) }
            end
            context 'Estructure when exists any error' do
                subject { payload_test }
                it { is_expected.to include(:error) }
            end
        end
        
        context 'Register Failed without token' do
            before do
                post :create, params: product
            end
            context 'Status code 401 Unauthorized' do
                subject { response }
                it { is_expected.to have_http_status(:unauthorized) }
            end
        end
    end
end
require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do

    describe "login session user" do
        let(:user) { create(:owner, password: '123456') }
        context "Success" do
            before {
                post(:login, format: :json, params: {
                    email: user.email,
                    password: '123456'
                })
            } 
            context "Status 200 OK" do
                subject { response }
                it { is_expected.to have_http_status(200) }
            end
    
            context "Body of response" do
                subject { payload_test }
                it { is_expected.to include(:id, :email, :birthdate, :store) }
            end

        end
        
        context "failure" do
            before {
                post(:login, format: :json, params: {
                    email: user.email,
                    password: 'fakepass'
                })
            } 

            context "Status 400 Bad Request" do
                subject { response }
                it { is_expected.to have_http_status(400) }
            end

            context "Body of response" do
                subject { payload_test }
                it { is_expected.to include(:error) }
            end
        end
    end
end
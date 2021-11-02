require 'rails_helper'

RSpec.describe Token, type: :model do
  describe 'validate data model' do
    subject { build(:token) }
    it 'token is present' do
      should validate_presence_of(:token)
    end
    it 'user_id is present' do
      should validate_presence_of(:user_id)
    end
    it 'exists a relation with user model' do
      should belong_to(:user)
    end
    it 'expires_at is present' do
      should validate_presence_of(:expires_at)
    end
  end
end

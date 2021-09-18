require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validate user model' do
    subject { build(:user) }
    describe 'that the field is present' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:birthdate) }
      it { should validate_presence_of(:password_digest) }
      it { should validate_presence_of(:type) }
    end

    describe 'that email field' do
      it 'should be unique' do
        should validate_uniqueness_of(:email)
      end
      it 'is a valid format' do
        should_not allow_value('invalid_email').for(:email)
      end
    end

    describe 'that birthdate field' do
      it 'should be a valid format' do
        should_not allow_value('invalid_birthdate').for(:birthdate)
      end
    end

  end
end

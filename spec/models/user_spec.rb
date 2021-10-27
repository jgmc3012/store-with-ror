require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validate user model' do
    subject { build(:owner) }
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
      it 'is a invalid format' do
        should_not allow_value('invalid_email').for(:email)
      end
      it 'is a valid format' do
        should allow_value('millan@asistensi.com').for(:email)
      end
    end

    describe 'that birthdate field' do
      it 'should be a valid format' do
        should_not allow_value('invalid_birthdate').for(:birthdate)
      end
    end

    it 'i can create only employee or owner type users' do
      should validate_inclusion_of(:type).in_array(%w[Employee Owner])
    end

    it 'validate that exists relation with store' do
      should belong_to(:store)
    end
  end
end

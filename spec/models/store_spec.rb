require 'rails_helper'

RSpec.describe Store, type: :model do
  describe "Validations store model" do
    subject { build(:store) }
    it 'Validate if the name exists' do
      should validate_presence_of(:name)
    end
    it 'Validate if exists relation with onwer' do
      should have_one(:owner)
    end
    it 'Validate if exists relation with employees' do
      should have_many(:employees)
    end
  end  
end

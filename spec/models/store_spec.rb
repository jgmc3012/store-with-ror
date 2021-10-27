require 'rails_helper'

RSpec.describe Store, type: :model do
  describe "Validations store model" do
    subject { build(:store) }
    it 'Validate if the name exists' do
      should validate_presence_of(:name)
    end
  end
  
end

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Product validations' do
    subject { build(:product) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:description) }
  end

  it 'Validate if store_id is present' do
    should validate_presence_of(:store_id)
  end

  it 'Validate if descrition is present' do
    should validate_presence_of(:description)
  end

  it 'Validate if price is present' do
    should validate_presence_of(:price)
  end

  it 'Validate before store' do
    should belong_to(:store) 
  end
end

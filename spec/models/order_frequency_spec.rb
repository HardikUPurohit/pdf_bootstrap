require 'rails_helper'

RSpec.describe OrderFrequency, type: :model do
  let!(:order_frequency) { create(:order_frequency) }
  context 'Validations' do
    it 'Creating invalid record' do
      expect(OrderFrequency.new.save).to eq(false)
    end
    
    it 'Updating record with invalid value' do
      expect(order_frequency.update(value: '')).to eq(false)
    end
  end
end

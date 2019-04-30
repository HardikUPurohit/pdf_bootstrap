require 'rails_helper'

RSpec.describe MedicationOrder, type: :model do
  let!(:medication_order) { create(:medication_order) }
  context 'Validation' do
    it 'Creating invalid record' do
      expect(MedicationOrder.new.save).to eq(false)
    end
    it 'Updating record with invalid value' do
      expect(medication_order.update(name: '')).to eq(false)
    end
  end

  context '#frequency' do
    let!(:order_frequency) { create(:order_frequency, medication_order: medication_order) }
    it 'returns order frequency' do
      expect(medication_order.frequency).to eq('q6hour')
    end
  end
end

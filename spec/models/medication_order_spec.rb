require 'rails_helper'

RSpec.describe MedicationOrder, type: :model do
  let!(:medication_order) { build(:medication_order) }
  context 'Validations Checks' do
    context 'without all mandatory fields' do
      let(:medication_order) { MedicationOrder.new }
      it 'not valid without all mandatory fields' do
        expect(medication_order.save).to be_falsey
        expect(medication_order.errors.full_messages).to include *["Name can't be blank", "Unit can't be blank", "Dosage can't be blank", "Route can't be blank", "Necessity can't be blank", "Patient must exist"]
      end
    end

    it 'not valid without name set' do
      medication_order.name = nil
      expect(medication_order.save).to be_falsey
      expect(medication_order.errors.full_messages).to include *["Name can't be blank"]
    end

    it 'not valid without unit set' do
      medication_order.unit = nil
      expect(medication_order.save).to be_falsey
      expect(medication_order.errors.full_messages).to include *["Unit can't be blank"]
    end

    it 'not valid without dosage set' do
      medication_order.dosage = nil
      expect(medication_order.save).to be_falsey
      expect(medication_order.errors.full_messages).to include *["Dosage can't be blank"]
    end

    it 'not valid without route set' do
      medication_order.route = nil
      expect(medication_order.save).to be_falsey
      expect(medication_order.errors.full_messages).to include *["Route can't be blank"]
    end

    it 'not valid without necessity set' do
      medication_order.necessity = nil
      expect(medication_order.save).to be_falsey
      expect(medication_order.errors.full_messages).to include *["Necessity can't be blank"]
    end

    it 'not valid without patient' do
      medication_order.patient = nil
      expect(medication_order.save).to be_falsey
      expect(medication_order.errors.full_messages).to include *["Patient must exist"]
    end

    context 'update with invalid date' do
      let!(:medication_order) { create(:medication_order) }
      
      it 'not valid with invalid date' do
        expect(medication_order.update(name: '')).to be_falsey
      end
    end
  end

  context '#frequency' do
    let!(:order_frequency) { create(:order_frequency, medication_order: medication_order) }
    
    it 'returns order frequency' do
      expect(medication_order.frequency).to eq('q6hour')
    end
  end
end

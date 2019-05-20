require 'rails_helper'

RSpec.describe OrderFrequency, type: :model do
  let!(:order_frequency) { build(:order_frequency) }
  context 'Validations Checks' do
    context 'without all mandatory fields' do
      let(:order_frequency) { OrderFrequency.new }

      it 'not valid without all mandatory fields' do
        expect(order_frequency.save).to be_falsey
        expect(order_frequency.errors.full_messages).to include *["Value can't be blank", "Unit can't be blank", "Medication order must exist"]
      end
    end

    it 'not valid without value set' do
      order_frequency.value = nil
      expect(order_frequency.save).to be_falsey
      expect(order_frequency.errors.full_messages).to include *["Value can't be blank"]
    end

    it 'not valid without description set' do
      order_frequency.unit = nil
      expect(order_frequency.save).to be_falsey
      expect(order_frequency.errors.full_messages).to include *["Unit can't be blank"]
    end

    it 'not valid without patient' do
      order_frequency.medication_order = nil
      expect(order_frequency.save).to be_falsey
      expect(order_frequency.errors.full_messages).to include *["Medication order must exist"]
    end

    context 'update with invalid date' do
      let!(:order_frequency) { create(:order_frequency) }
      
      it 'not valid with invalid date' do
        expect(order_frequency.update(value: '')).to be_falsey
      end
    end
  end
end

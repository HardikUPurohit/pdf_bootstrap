require 'rails_helper'

RSpec.describe Treatment, type: :model do
  let!(:treatment) { build(:treatment) }
  context 'Validations Checks' do
    context 'without all mandatory fields' do
      let(:treatment) { Treatment.new }

      it 'not valid without all mandatory fields' do
        expect(treatment.save).to be_falsey
        expect(treatment.errors.full_messages).to include *["Description can't be blank", "Necessity can't be blank", "Patient must exist"]
      end
    end

    it 'not valid without description set' do
      treatment.description = nil
      expect(treatment.save).to be_falsey
      expect(treatment.errors.full_messages).to include *["Description can't be blank"]
    end

    it 'not valid without necessity set' do
      treatment.necessity = nil
      expect(treatment.save).to be_falsey
      expect(treatment.errors.full_messages).to include *["Necessity can't be blank"]
    end

    it 'not valid without patient' do
      treatment.patient = nil
      expect(treatment.save).to be_falsey
      expect(treatment.errors.full_messages).to include *["Patient must exist"]
    end

    context 'update with invalid description' do
      let!(:treatment) { create(:treatment) }
      
      it 'not valid with invalid date' do
        expect(treatment.update(description: '')).to be_falsey
      end
    end
  end
end

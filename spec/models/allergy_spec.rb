require 'rails_helper'

RSpec.describe Allergy, type: :model do
  let!(:allergy) { build(:allergy) }

  context 'Validations Checks' do
    context 'without all mandatory fields' do
      let(:allergy) { Allergy.new }

      it 'not valid without all mandatory fields' do
        expect(allergy.save).to be_falsey
        expect(allergy.errors.full_messages).to include *["Description can't be blank", "Patient must exist"]
      end
    end

    it 'not valid without description set' do
      allergy.description = nil
      expect(allergy.save).to be_falsey
      expect(allergy.errors.full_messages).to include *["Description can't be blank"]
    end

    it 'not valid without patient' do
      allergy.patient = nil
      expect(allergy.save).to be_falsey
      expect(allergy.errors.full_messages).to include *["Patient must exist"]
    end

    context 'update with invalid description' do
      let!(:symptom) { create(:symptom) }
      
      it 'not valid with invalid date' do
        expect(symptom.update(description: '')).to be_falsey
      end
    end
  end
end

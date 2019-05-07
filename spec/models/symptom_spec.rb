require 'rails_helper'

RSpec.describe Symptom, type: :model do
  let!(:symptom) { create(:symptom) }
  context 'Validations Checks' do
    context 'without all mandatory fields' do
      let(:symptom) { Symptom.new }

      it 'not valid without all mandatory fields' do
        expect(symptom.save).to be_falsey
        expect(symptom.errors.full_messages).to include *["Description can't be blank", "Admission must exist"]
      end
    end

    it 'not valid without description set' do
      symptom.description = nil
      expect(symptom.save).to be_falsey
      expect(symptom.errors.full_messages).to include *["Description can't be blank"]
    end

    it 'not valid without admission' do
      symptom.admission = nil
      expect(symptom.save).to be_falsey
      expect(symptom.errors.full_messages).to include *["Admission must exist"]
    end

    context 'update with invalid description' do
      let!(:symptom) { create(:symptom) }
      
      it 'not valid with invalid date' do
        expect(symptom.update(description: '')).to be_falsey
      end
    end
  end
end

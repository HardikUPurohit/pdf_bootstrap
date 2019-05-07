require 'rails_helper'

RSpec.describe Observation, type: :model do
  let!(:observation) { build(:observation) }
  context 'Validations Checks' do
    context 'without all mandatory fields' do
      let(:observation) { Observation.new }

      it 'not valid without all mandatory fields' do
        expect(observation.save).to be_falsey
        expect(observation.errors.full_messages).to include *["Moment can't be blank", "Description can't be blank", "Admission must exist"]
      end
    end

    it 'not valid without moment set' do
      observation.moment = nil
      expect(observation.save).to be_falsey
      expect(observation.errors.full_messages).to include *["Moment can't be blank"]
    end

    it 'not valid without description set' do
      observation.description = nil
      expect(observation.save).to be_falsey
      expect(observation.errors.full_messages).to include *["Description can't be blank"]
    end

    it 'not valid without patient' do
      observation.admission = nil
      expect(observation.save).to be_falsey
      expect(observation.errors.full_messages).to include *["Admission must exist"]
    end

    context 'update with invalid date' do
      let!(:observation) { create(:observation) }
      
      it 'not valid with invalid date' do
        expect(observation.update(moment: '')).to be_falsey
      end
    end
  end
end

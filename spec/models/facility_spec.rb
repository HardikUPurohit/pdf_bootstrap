require 'rails_helper'

RSpec.describe Facility, type: :model do
  let(:facility) { build(:facility) }

  context 'Validations Checks' do

    it 'not valid without name set' do
      facility.name = nil
      expect(facility.save).to be_falsey
      expect(facility.errors.full_messages).to include *["Name can't be blank"]
    end

    context 'update with invalid date' do
      let!(:facility) { create(:facility) }
      
      it 'not valid with invalid date' do
        expect(facility.update(name: '')).to be_falsey
      end
    end
  end

  context 'Create new record' do
    it 'Facility count increased by 1' do
      expect { create(:facility) }.to change { Facility.count }.by(1)
    end
  end
end

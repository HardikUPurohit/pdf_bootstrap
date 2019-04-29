require 'rails_helper'

RSpec.describe Allergy, type: :model do
  let!(:allergy) { create(:allergy) }
  context 'Validation' do
    describe 'name should be presence' do
      it 'Creating invalid record' do
        expect(Allergy.new.save).to eq(false)
      end
      it 'Updating record with invalid value' do
        expect(allergy.update(description: '')).to eq(false)
      end
    end
  end
end

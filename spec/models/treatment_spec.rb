require 'rails_helper'

RSpec.describe Treatment, type: :model do
  let!(:treatment) { create(:treatment) }
  context 'Validation' do
    describe 'name should be presence' do
      it 'Creating invalid record' do
        expect(Treatment.new.save).to eq(false)
      end
      it 'Updating record with invalid value' do
        expect(treatment.update(description: '')).to eq(false)
      end
    end
  end
end

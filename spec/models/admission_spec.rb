require 'rails_helper'

RSpec.describe Admission, type: :model do
  let(:admission) { Admission.create!(moment: DateTime.now, patient_id: 1, facility_id: 1) }
  
  context 'Validation' do
    describe 'invalid' do
      it 'Creating invalid record' do
        expect(Admission.new.save).to eq(false)
      end
      it 'Updaing record with invalid value' do
        expect(admission.update(moment: '')).to eq(false)
      end
    end
  end

  context 'Create new record' do
    it 'Admission count increased by 1' do
      # expect{admission}.to change{Admission.count}.by(1)
    end
  end
end
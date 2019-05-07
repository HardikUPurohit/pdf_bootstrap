require 'rails_helper'

RSpec.describe Symptom, type: :model do
  let!(:symptom) { create(:symptom) }
  context 'Validation' do
    it 'Creating invalid record' do
      expect(Symptom.new.save).to eq(false)
    end
    
    it 'Updating record with invalid value' do
      expect(symptom.update(description: '')).to eq(false)
    end
  end
end

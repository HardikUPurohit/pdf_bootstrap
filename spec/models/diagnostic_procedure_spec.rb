require 'rails_helper'

RSpec.describe DiagnosticProcedure, type: :model do
  let!(:diagnostic_procedure) { create(:diagnostic_procedure) }
  context 'Validation' do
    it 'Creating invalid record' do
      expect(DiagnosticProcedure.new.save).to eq(false)
    end
    
    it 'Updating record with invalid value' do
      expect(diagnostic_procedure.update(description: '')).to eq(false)
    end
  end

  context '#date' do
    it 'returns formatted date' do
      expect(diagnostic_procedure.date).to eq('April 29, 2019')
    end
  end

  context '#time' do
    it 'returns formatted time' do
      expect(diagnostic_procedure.time).to eq(' 3:11 pm')
    end
  end
end

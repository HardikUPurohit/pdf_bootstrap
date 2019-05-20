require 'rails_helper'

RSpec.describe DiagnosticProcedure, type: :model do
  let!(:diagnostic_procedure) { build(:diagnostic_procedure) }
  
  context 'Validations Checks' do
    context 'without all mandatory fields' do
      let(:diagnostic_procedure) { DiagnosticProcedure.new }

      it 'not valid without all mandatory fields' do
        expect(diagnostic_procedure.save).to be_falsey
        expect(diagnostic_procedure.errors.full_messages).to include *["Moment can't be blank", "Description can't be blank", "Patient must exist"]
      end
    end

    it 'not valid without moment set' do
      diagnostic_procedure.moment = nil
      expect(diagnostic_procedure.save).to be_falsey
      expect(diagnostic_procedure.errors.full_messages).to include *["Moment can't be blank"]
    end

    it 'not valid without description set' do
      diagnostic_procedure.description = nil
      expect(diagnostic_procedure.save).to be_falsey
      expect(diagnostic_procedure.errors.full_messages).to include *["Description can't be blank"]
    end

    it 'not valid without patient' do
      diagnostic_procedure.patient = nil
      expect(diagnostic_procedure.save).to be_falsey
      expect(diagnostic_procedure.errors.full_messages).to include *["Patient must exist"]
    end

    context 'update with invalid date' do
      let!(:diagnostic_procedure) { create(:diagnostic_procedure) }
      
      it 'not valid with invalid date' do
        expect(diagnostic_procedure.update(moment: '')).to be_falsey
      end
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

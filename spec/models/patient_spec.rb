require 'rails_helper'

RSpec.describe Patient, type: :model do
  let!(:patient) { create(:patient) }
  context 'Validations Checks' do
    context 'without all mandatory fields' do
      let(:patient) { Patient.new }

      it 'not valid without all mandatory fields' do
        expect(patient.save).to be_falsey
        expect(patient.errors.full_messages).to include *["First name can't be blank", "Last name can't be blank", "Mr can't be blank", "Dob can't be blank", "Gender can't be blank"]
      end
    end

    it 'not valid without first_name set' do
      patient.first_name = nil
      expect(patient.save).to be_falsey
      expect(patient.errors.full_messages).to include *["First name can't be blank"]
    end

    it 'not valid without last_name set' do
      patient.last_name = nil
      expect(patient.save).to be_falsey
      expect(patient.errors.full_messages).to include *["Last name can't be blank"]
    end

    it 'not valid without mr set' do
      patient.mr = nil
      expect(patient.save).to be_falsey
      expect(patient.errors.full_messages).to include *["Mr can't be blank"]
    end

    it 'not valid without dob set' do
      patient.dob = nil
      expect(patient.save).to be_falsey
      expect(patient.errors.full_messages).to include *["Dob can't be blank"]
    end

    it 'not valid without gender set' do
      patient.gender = nil
      expect(patient.save).to be_falsey
      expect(patient.errors.full_messages).to include *["Gender can't be blank"]
    end

    context 'update with invalid date' do
      let!(:patient) { create(:patient) }
      
      it 'not valid with invalid date' do
        expect(patient.update(first_name: '')).to be_falsey
      end
    end
  end

  context '#age' do
    it 'returns age' do
      expect(patient.age).to eq(43)
    end
  end

  context '#facility_name' do
    let!(:admission) { create(:admission, patient: patient) }
    
    it 'returns facility' do
      expect(patient.facility_name).to eq('Blue Alps Ski Camp')
    end
  end

  context '#allergies_description' do
    let!(:allergy) { create(:allergy, patient: patient) }
    
    it 'returns allergies array' do
      expect(patient.allergies_description).to eq(['gluten intolerance'])
    end
  end

  context '#medications_text' do
    let!(:medication_order) { create(:medication_order, patient: patient) }
    let!(:order_frequency) { create(:order_frequency, medication_order: medication_order) }
    it 'returns medication array' do
      expect(patient.medications_text).to eq(['Acetaminophen, 500.0mg, PO, q6hour to relieve pain'])
    end
  end

  context '#treatments_text' do
    let!(:treatment) { create(:treatment, patient: patient) }
    
    it 'returns treatment array' do
      expect(patient.treatments_text).to eq(['temporary bracing the right leg to restrict the motion'])
    end
  end

  context '#chronic_condition_text' do
    it 'returns chronic condition array' do
      expect(patient.chronic_condition_text).to eq(['Asthma (J45)', 'a closed fracture in the right tibia (S82.101A)'])
    end
  end

  context '#diagnostic_procedure_text' do
    let!(:diagnostic_procedure) { create(:diagnostic_procedure, patient: patient) }
    
    it 'returns diagnostic procedure array' do
      expect(patient.diagnostic_procedure_text).to eq(['an exploratory radiography on April 29, 2019 at 3:11 pm'])
    end
  end

  context '#diagnoses_text' do
    it '#diagnoses_text' do
      expect(patient.diagnoses_text).to eq(['a fracture of upper end of the right tibia (S82.101)', 'Asthma (J45)'])
    end
  end
end

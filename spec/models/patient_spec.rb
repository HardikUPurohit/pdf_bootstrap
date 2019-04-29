require 'rails_helper'

RSpec.describe Patient, type: :model do
  let!(:patient) { create(:patient) }

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
end

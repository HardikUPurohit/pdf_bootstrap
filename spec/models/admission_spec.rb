require 'rails_helper'

RSpec.describe Admission, type: :model do
  let(:admission) { build(:admission) }
      
  context 'Validations Checks' do
    context 'without all mandatory fields' do
      let(:admission) { Admission.new }

      it 'not valid without all mandatory fields' do
        expect(admission.save).to be_falsey
        expect(admission.errors.full_messages).to include *["Moment can't be blank", "Facility must exist", "Patient must exist"]
      end
    end

    it 'not valid without moment set' do
      admission.moment = nil
      expect(admission.save).to be_falsey
      expect(admission.errors.full_messages).to include *["Moment can't be blank"]
    end

    it 'not valid without facility' do
      admission.facility = nil
      expect(admission.save).to be_falsey
      expect(admission.errors.full_messages).to include *["Facility must exist"]
    end

    it 'not valid without patient' do
      admission.patient = nil
      expect(admission.save).to be_falsey
      expect(admission.errors.full_messages).to include *["Patient must exist"]
    end

    context 'update with invalid date' do
      let!(:admission) { create(:admission) }
      
      it 'not valid with invalid date' do
        expect(admission.update(moment: '')).to be_falsey
      end
    end
  end

  context '#date' do
    it 'returns formatted date' do
      expect(admission.date).to eq('April 29, 2019')
    end
  end

  context '#time' do
    it 'returns formatted time' do
      expect(admission.time).to eq(' 3:11 pm')
    end
  end

  context '#symptom_text' do
    let!(:symptom) { create(:symptom, admission: admission) }
    let!(:symptom_swelling) { create(:symptom_swelling, admission: admission) }
    let!(:symptom_joint) { create(:symptom_joint, admission: admission) }

    it 'returns array of symptoms' do
      expect(admission.symptom_text).to eq(['severe pain', 'swelling', 'limited bending of the joint'])
    end
  end

  context '#observation_text' do
    let!(:observation) { create(:observation, admission: admission) }

    it 'returns observations array' do
      expect(admission.observation_text).to eq(['No soft tissues were damaged.'])
    end
  end

  context '#diagnoses_text' do
    let!(:admission) { create(:admission) }
      
    it 'returns diagnosis array' do
      expect(admission.diagnoses_text).to eq(['a fracture of upper end of the right tibia (S82.101)', 'Asthma (J45)'])
    end
  end
end

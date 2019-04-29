require 'rails_helper'

RSpec.describe Admission, type: :model do
  let!(:admission) { create(:admission) }

  context 'Validations' do
    describe 'invalid' do
      it 'Creating invalid record' do
        expect(Admission.new.save).to eq(false)
      end
      it 'Updating record with invalid value' do
        expect(admission.update(moment: '')).to eq(false)
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

    it 'returns symptoms array' do
      expect(admission.symptom_text).to eq(['severe pain', 'swelling', 'limited bending of the joint'])
    end
  end

  context '#observation_text' do
    let!(:observation) { create(:observation, admission: admission) }
    it 'returns observations array' do
      expect(admission.observation_text).to eq(['No soft tissues were damaged.'])
    end
  end
end

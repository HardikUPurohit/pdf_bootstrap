require 'rails_helper'

RSpec.describe Observation, type: :model do
  let!(:observation) { create(:observation) }
  context 'Validations' do
    it 'Creating invalid record' do
      expect(Observation.new.save).to eq(false)
    end
    it 'Updating record with invalid value' do
      expect(observation.update(description: '')).to eq(false)
    end
  end
end

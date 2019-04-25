require 'rails_helper'

RSpec.describe Facility, type: :model do
  let(:facility) { Facility.create(name: 'new facility') }
  
  context 'Validation' do
    describe 'name should be presence' do
      it 'Creating invalid record' do
        expect(Facility.new.save).to eq(false)
      end
      it 'Updaing record with invalid value' do
        expect(facility.update(name: '')).to eq(false)
      end
    end
  end

  context 'Create new record' do
    it 'Facility count increased by 1' do
      expect{facility}.to change{Facility.count}.by(1)
    end
  end
end
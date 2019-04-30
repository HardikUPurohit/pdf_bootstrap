require 'rails_helper'

RSpec.describe PatientsController, type: 'feature' do
  let!(:patient) { create(:patient) }
  let!(:admission) { create(:admission, patient: patient) }
  context 'redirects to show page' do
    it 'redirects to show page' do
      visit '/patients'
      click_link(patient.first_name)
      expect(page).to have_content 'Back'
    end
  end

  context 'show page' do
    before do
      visit "/patients/#{patient.id}"
    end

    it 'checks the facility name' do
      expect(page).to have_content admission.facility.name
    end

    it 'checks the first_name' do
      expect(page).to have_content patient.first_name
    end

    it 'redirects to index page' do
      click_link('back')
      expect(page).to have_content 'Patients'
    end
  end
end

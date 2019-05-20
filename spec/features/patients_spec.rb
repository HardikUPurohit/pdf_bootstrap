require 'rails_helper'

RSpec.describe PatientsController, type: 'feature' do
  let!(:patient) { create(:patient) }
  let!(:admission) { create(:admission, patient: patient) }
  
  context 'view all patients' do
    it 'redirects to index' do
      visit '/patients'
       expect(page).to have_css('h2', text: 'Patients')
       expect(page).to have_css('.table-bordered tbody tr td a', text: patient.first_name)
    end
  end

  context 'show page' do
    before do
      visit "/patients/#{patient.id}"
    end

    it 'should have Fransferring Facility Information' do
      expect(page).to have_css('.transferring_facility div.panel-heading h4', text: 'Transferring Facility')
      expect(page).to have_css('.transferring_facility div.panel-body p', text: admission.facility.name)
    end

    it 'should have Patient Information' do
      expect(page).to have_css('.patient_information div.panel-heading h4', text: 'Patient Information')
      expect(page).to have_css('.patient_information tbody tr td', text: patient.first_name)
    end

    it 'should have Summary' do
      expect(page).to have_css('.summary div.panel-heading h4', text: 'Summary')
      expect(page).to have_css('.summary div.panel-body', text: /43 years old/)
    end

    it 'clik on Back link redirects to index page' do
      expect(page).to have_link('back')

      click_link('back')
      expect(page).to have_content 'Patients'
    end
  end
end

require 'rails_helper'

RSpec.describe PatientsController do
  describe 'GET index' do
    it 'assigns @patients' do
      patient = create(:patient)
      get :index
      expect(assigns(:patients)).to eq([patient])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    let(:patient) { create(:patient) }

    it 'finds @patient' do
      get :show, params: { id: patient.id }
      expect(assigns(:patient)).to eq(patient)
    end

    it 'renders the show template' do
      get :show, params: { id: patient.id }
      expect(response).to render_template('show')
    end
  end
end

require 'rails_helper'

RSpec.describe PatientsController do
  describe 'GET index' do
    let!(:patient) { create(:patient) }
    let!(:another_patient) { create(:patient) }

    it 'lists all patients' do
      get :index

      expect(response).to have_http_status :ok
      expect(response).to render_template 'index'
      expect(assigns(:patients)).to include patient
    end
  end

  describe 'GET show' do
    context 'with existing patient' do
      let(:patient) { create(:patient) }
      
      it 'returns patient details' do
        get :show, params: { id: patient.id }

        expect(response).to have_http_status :ok
        expect(response).to render_template 'show'
        expect(assigns(:patient)).to eq patient
      end
    end

    context 'patient not exists' do
      it 'redirects to error page' do
        get :show, params: { id: 100 }

        expect(response).to have_http_status :not_found
        expect(assigns(:patient)).to be_nil
      end
    end
  end
end

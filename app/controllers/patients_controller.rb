class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find_by(id: params[:id]) or not_found
  end
end

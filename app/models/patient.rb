class Patient < ApplicationRecord
  # Enums
  enum gender: { male: 0, female: 1, other: 2 }

  # Relations
  has_one :admission
  has_many :patient_chronic_conditions
  has_many :chronic_conditions, through: :patient_chronic_conditions, dependent: :destroy
  has_many :medication_orders, dependent: :destroy
  has_many :diagnostic_procedures, dependent: :destroy
  has_many :patient_diagnoses
  has_many :diagnoses, through: :patient_diagnoses, dependent: :destroy
  has_many :treatments, dependent: :destroy
  has_many :allergies, dependent: :destroy

  def age
    DateTime.now.utc.year - dob.year
  end

  def facility_name
    admission.facility.name
  end

  def allergies_description
    allergies.map(&:description)
  end

  def chronic_condition_text
    chronic_conditions.map { |c| "#{c.description} #{c.code}" }
  end

  def medications_text
    medication_orders.map { |m| "#{m.name}, #{m.dosage}#{m.unit}, #{m.route}, #{m.frequency} to #{m.necessity}" }
  end

  def diagnostic_procedure_text
    diagnostic_procedures.map { |d| "#{d.description} on #{d.date} at#{d.time}" }
  end

  def diagnoses_text
    diagnoses.map { |d| "#{d.description} #{d.code}" }
  end

  def treatments_text
    treatments.map{ |t| "#{t.description} to #{t.necessity}" }
  end
end

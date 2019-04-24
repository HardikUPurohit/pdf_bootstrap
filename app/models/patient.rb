class Patient < ApplicationRecord
  # Enums
  enum gender: { male: 0, female: 1, other: 2 }

  # Relations
  has_one :admission
  has_many :patient_chronic_conditions
  has_many :chronic_conditions, through: :patient_chronic_conditions
  has_many :medication_orders
  has_many :diagnostic_procedures
  has_many :patient_diagnoses
  has_many :diagnoses, through: :patient_diagnoses
  has_many :treatments
  has_many :allergies
end

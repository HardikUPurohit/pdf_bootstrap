class Patient < ApplicationRecord
  # Enums
  enum status: { male: 0, female: 1, other: 2 }

  # Relations
  has_one :admission
  has_many :chronic_conditions, through: :patient_chronic_condition
  has_many :medication_orders
  has_many :diagnostic_procedures
  has_many :diagnoses, through: :patient_diagnosis
  has_many :treatments
  has_many :allergies
end

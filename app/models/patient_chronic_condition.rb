class PatientChronicCondition < ApplicationRecord
  belongs_to :chronic_condition, class_name: 'Diagnosis'
  belongs_to :patient
end

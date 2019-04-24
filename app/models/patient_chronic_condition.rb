class PatientChronicCondition < ApplicationRecord
  belongs_to :chronic_condition, foreign_key: :diagnosis_id, primary_key: :diagnosis_id
  belongs_to :patient
end

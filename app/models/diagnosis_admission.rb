class DiagnosisAdmission < ApplicationRecord
  belongs_to :admission
  belongs_to :diagnosis
end

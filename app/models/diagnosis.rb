class Diagnosis < ApplicationRecord
  has_many :diagnosis_admissions
  has_many :admissions, through: :diagnosis_admissions, dependent: :destroy
end

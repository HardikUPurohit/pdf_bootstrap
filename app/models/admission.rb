class Admission < ApplicationRecord
  belongs_to :facility
  belongs_to :patient
  has_many :SC
  has_many :diagnosis_admissions
  has_many :diagnoses, through: :diagnosis_admissions
  has_many :observations
  has_many :symptoms
end

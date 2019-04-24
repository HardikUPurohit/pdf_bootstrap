class Admission < ApplicationRecord
  belongs_to :facility
  belongs_to :patient
  has_many :diagnoses, through: :diagnosis_admission
end

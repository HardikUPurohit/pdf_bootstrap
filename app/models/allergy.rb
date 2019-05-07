class Allergy < ApplicationRecord
  # Validations
  validates :description, :patient, presence: true

  # Relations
  belongs_to :patient
end

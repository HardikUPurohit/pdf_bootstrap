class Allergy < ApplicationRecord
  # Validations
  validates :description, presence: true

  # Relations
  belongs_to :patient
end

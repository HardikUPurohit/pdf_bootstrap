class Symptom < ApplicationRecord
  # Validations
  validates :description, presence: true

  # Relations
  belongs_to :admission
end

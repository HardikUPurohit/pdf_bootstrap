class Symptom < ApplicationRecord
  # Validations
  validates :description, :admission, presence: true

  # Relations
  belongs_to :admission
end

class Symptom < ApplicationRecord
  # Validations
  validates :description, :necessity, :admission, presence: true

  # Relations
  belongs_to :admission
end

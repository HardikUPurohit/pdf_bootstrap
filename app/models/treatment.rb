class Treatment < ApplicationRecord
  # Validations
  validates :description, :necessity, :patient, presence: true

  # Relations
  belongs_to :patient
end

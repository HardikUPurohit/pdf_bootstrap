class Treatment < ApplicationRecord
  # Validations
  validates :description, :necessity, presence: true

  # Relations
  belongs_to :patient
end

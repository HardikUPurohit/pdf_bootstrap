class Observation < ApplicationRecord
  # Validations
  validates :description, :moment, presence: true

  # Relations
  belongs_to :admission
end

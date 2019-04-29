class Observation < ApplicationRecord
  # Validations
  validates :description, :moment, :admission, presence: true

  # Relations
  belongs_to :admission
end

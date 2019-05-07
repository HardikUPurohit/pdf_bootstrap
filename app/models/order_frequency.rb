class OrderFrequency < ApplicationRecord
  # Validations
  validates :value, :unit, :medication_order, presence: true

  # Enums
  enum unit: { hour: 0 }

  # Relations
  belongs_to :medication_order
end

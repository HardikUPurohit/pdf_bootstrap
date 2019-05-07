class MedicationOrder < ApplicationRecord
  # Validations
  validates :name, :unit, :dosage, :route, :necessity, presence: true

  # Enums
  enum unit: { mg: 0 }
  enum route: { PO: 0, IM: 1, SC: 2 }

  # Relations
  belongs_to :patient
  has_one :order_frequency, dependent: :destroy

  def frequency
    "#{order_frequency.value}#{order_frequency.unit}"
  end
end

class MedicationOrder < ApplicationRecord
  # Enums
  enum unit: { mg: 0 }
  enum route: { PO: 0, IM: 1, SC: 2 }

  # Relations
  belongs_to :patient
  has_one :order_frequency
end

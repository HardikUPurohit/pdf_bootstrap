class OrderFrequency < ApplicationRecord
  # Enums
  enum unit: { hour: 0 }

  # Relations
  belongs_to :medication_order
end

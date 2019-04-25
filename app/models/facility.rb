class Facility < ApplicationRecord
  # Validations
  validates :name, presence: true

  # Associations
  has_many :admissions, dependent: :destroy
end

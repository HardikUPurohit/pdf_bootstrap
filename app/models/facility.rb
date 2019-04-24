class Facility < ApplicationRecord
  has_many :admissions, dependent: :destroy
end

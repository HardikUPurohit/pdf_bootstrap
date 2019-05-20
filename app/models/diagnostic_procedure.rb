class DiagnosticProcedure < ApplicationRecord
  # Validations
  validates :description, :moment, presence: true

  # Associations
  belongs_to :patient

  def date
    moment.in_time_zone('Chennai').strftime('%B %d, %Y')
  end

  def time
    moment.in_time_zone('Chennai').strftime('%l:%M %P')
  end
end

class DiagnosticProcedure < ApplicationRecord
  belongs_to :patient

  def date
    moment.strftime('%B %d, %Y')
  end

  def time
    moment.strftime('%l:%M %P')
  end
end

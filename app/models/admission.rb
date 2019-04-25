class Admission < ApplicationRecord

  # Validations
  validates :moment, :patient, :facility, presence: true

  # Relations
  belongs_to :facility
  belongs_to :patient
  has_many :SC, dependent: :destroy
  has_many :diagnosis_admissions
  has_many :diagnoses, through: :diagnosis_admissions, dependent: :destroy
  has_many :observations, dependent: :destroy
  has_many :symptoms, dependent: :destroy

  def date
    moment.strftime('%B %d, %Y')
  end

  def time
    moment.strftime('%l:%M %P')
  end

  def diagnoses_text
    diagnoses.map { |d| "#{d.description} #{d.code}" }
  end

  def symptom_text
    symptoms.map(&:description)
  end

  def observation_text
    observations.map(&:description)
  end
end

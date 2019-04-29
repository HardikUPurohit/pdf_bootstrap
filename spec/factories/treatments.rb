FactoryBot.define do
  factory :treatment do
    description 'temporary bracing the right leg'
    necessity 'restrict the motion'
    association :patient, factory: :patient
  end
end

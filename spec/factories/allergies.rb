FactoryBot.define do
  factory :allergy do
    description 'gluten intolerance'
    association :patient, factory: :patient
  end
end

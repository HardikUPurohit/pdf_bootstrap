FactoryBot.define do
  factory :medication_order do
    name 'Acetaminophen'
    unit 'mg'
    dosage 0.5e3
    route 'PO'
    necessity 'relieve pain'
    association :patient, factory: :patient
  end
end

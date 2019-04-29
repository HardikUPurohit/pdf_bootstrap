FactoryBot.define do
  factory :diagnosis do
    code '(S82.101)'
    description 'a fracture of upper end of the right tibia'
  end

  factory :diagnosis_2, class: 'Diagnosis' do
    code '(J45)'
    description 'Asthma'
  end

  factory :diagnosis_3, class: 'Diagnosis' do
    code '(S82.101A)'
    description 'a closed fracture in the right tibia'
  end
end

FactoryBot.define do
  factory :symptom do
    description 'severe pain'
    association :admission, factory: :admission
  end

  factory :symptom_swelling, class: 'Symptom' do
    description 'swelling'
    association :admission, factory: :admission
  end

  factory :symptom_joint, class: 'Symptom' do
    description 'limited bending of the joint'
    association :admission, factory: :admission
  end
end

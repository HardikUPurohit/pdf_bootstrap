FactoryBot.define do
  factory :admission do
    moment '2019-04-29T15:11:46+05:30'.to_datetime.in_time_zone("Chennai")
    association :facility, factory: :facility
    association :patient, factory: :patient

    after(:create) do |admission|
      admission.diagnoses << FactoryBot.create(:diagnosis)
      admission.diagnoses << FactoryBot.create(:diagnosis_2)
    end
  end
end

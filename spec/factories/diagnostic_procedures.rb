FactoryBot.define do
  factory :diagnostic_procedure do
    description 'an exploratory radiography'
    moment '2019-04-29T15:11:46+05:30'.to_datetime.in_time_zone("Chennai")
    association :patient, factory: :patient
  end
end

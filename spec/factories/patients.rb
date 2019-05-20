FactoryBot.define do
  factory :patient do
    first_name 'Thomas'
    middle_name ''
    last_name 'Schudel'
    mr '30997'
    dob DateTime.now - 43.years
    gender 1

    after(:create) do |patient|
      patient.diagnoses << FactoryBot.create(:diagnosis)
      patient.diagnoses << FactoryBot.create(:diagnosis_2)

      patient.chronic_conditions << FactoryBot.create(:diagnosis_2)
      patient.chronic_conditions << FactoryBot.create(:diagnosis_3)
    end
  end
end

FactoryBot.define do
  factory :patient do
    first_name 'Thomas'
    middle_name ''
    last_name 'Schudel'
    mr '30997'
    dob DateTime.now - 43.years
    gender 1
  end
end

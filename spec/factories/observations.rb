FactoryBot.define do
  factory :observation do
    description 'No soft tissues were damaged.'
    moment DateTime.now + 30.minutes - 30.days
    association :admission, factory: :admission
  end
end

FactoryBot.define do
  factory :order_frequency do
    value 'q6'
    unit 'hour'
    association :medication_order, factory: :medication_order
  end
end

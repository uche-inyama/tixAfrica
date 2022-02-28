FactoryBot.define do
  factory :event do
    start_date { Faker::Date.forward(days: 5) }
    end_date { Faker::Date.forward(days: 20)}
    time { Faker::Time.backward(days: 5, period: :morning, format: :short) }
    address { Faker::Address.full_address }
    theme { Faker::Quote.robin }
    details { Faker::Quote.jack_handey }
    image_data { nil }
    event_type { 'paid' }
    status { 'active' }
    user_id { nil }
  end
end



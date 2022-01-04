FactoryBot.define do
  factory :event do
    date { Faker::Date.in_date_period }
    time { Faker::Time.backward(days: 5, period: :morning, format: :short) }
    address { Faker::Address.full_address }
    theme { Faker::Quote.robin }
    details { Faker::Quote.jack_handey }
    image { Faker::Internet.url }
    event_type { 'paid' }
    status { 'active' }
    user_id { nil }
  end
end
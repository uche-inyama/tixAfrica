FactoryBot.define do
  factory :event do
    start_date { Faker::Date.in_date_period }
    end_date { Faker::Date.in_date_period }
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

# "size":122730,
# "mime_type":"image/png", 
# "width": "359",
# "height": "360"
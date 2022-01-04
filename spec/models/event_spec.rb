require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:time) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:theme) }
  it { should validate_presence_of(:details) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:event_type) }
  it { should validate_presence_of(:status) }
end

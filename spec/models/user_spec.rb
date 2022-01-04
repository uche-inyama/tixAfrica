require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:events).dependent(:destroy) }
  it { validate_presence_of(:email) }
  it { validate_presence_of(:password) }
end
require 'rails_helper'

RSpec.describe Event, type: :model do

  let!(:user) { create(:user) }
  let!(:event) { create(:event,  user_id: user.id) }

  it { should belong_to(:user) }
  it { should validate_presence_of(:time) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:theme) }
  it { should validate_presence_of(:details) }
  it { should validate_presence_of(:event_type) }
  it { should validate_presence_of(:status) }

  describe "get_status" do
    it "should return inactive" do
      expect(event.get_status(event.end_date)).to eq('active')
    end 
  end

end


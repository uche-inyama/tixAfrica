require 'rails_helper'

RSpec.describe "Events", type: :request do

  let!(:user) { create(:user) }
  let!(:events) { create_list(:event, 10, user_id: user.id) }
  let(:id) { events.first.id }

  describe "GET /events" do
    before { get "/events" }

    it 'returns status code 200' do
      expect(response).to be_successful
      expect(response.body).to include("Say hello to events")
    end
  end

  describe "GET /events/:id" do
    before { get "/events/#{user.id}"}

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /events" do
    let(:valid_event) { {
      time: '7:00 PM - 12:00 AM',
      Address: 'xyz',
      theme: 'hello world',
      details: 'hello world',
      image: 'xyz',
      event_type: 'paid',
      status: 'active',
      user_id: 1
    } }

    before { post "/events", params: valid_event }
    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end

  describe "PUT events/:id" do
    let(:valid_event) {{
      address: 'abc'
    }}
    before { put "/events/#{id}", params: valid_event }

    it 'returns status 204' do
      expect(response).to have_http_status(204)
    end
  end

  describe "DELETE events/:id" do
    before { delete "/events/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

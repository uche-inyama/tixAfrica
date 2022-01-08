require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe "Events", type: :request do

  let!(:user) { create(:user) }
  let!(:events) { create_list(:event, 10, user_id: user.id) }
  let(:id) { events.first.id }

  describe "GET /events" do
    before { login_as user, scope: :user }
    before { get "/events" }

    it 'returns status code 200' do
      expect(response).to be_successful
    end
  end

  describe "GET /events/:id" do
    before { get "/events/#{id}"}

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /events" do
    before { login_as user, scope: :user }

    let(:params) do 
      { 
        event: {
        start_date: 'Sunday, January 9 2022',
        end_date: 'Sunday, January 9 2022',
        time: '7:00 PM - 12:00 AM',
        address: 'abc',
        theme: 'hello world',
        details: 'hello world',
        image: nil,
        event_type: 'paid',
        status: 'active',
        user_id: 1
      }
    }
  end

    before { post "/events", params: params }
    it 'returns status code 302' do
      expect(response).to have_http_status(302)
    end
  end

  describe "PUT events/:id" do
    let(:params) do 
      { 
        event: { address: 'xyz', user_id: 1 }
      }
    end
    before { put "/events/#{id}", params: params }
    it 'returns status 302' do
      expect(response).to have_http_status(302)
    end
  end

  describe "DELETE events/:id" do
    before { delete "/events/#{id}" }

    it 'returns status code 302' do
      expect(response).to have_http_status(302)
    end
  end
end

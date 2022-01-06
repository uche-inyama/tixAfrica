require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /users, Registers a user" do
    let(:params) do 
      { 
        user: { email: 'xyz@gmail.com', password: 'xxxxxxx' }
      }
    end
    before { post "/users", params: params }

    it 'returns status code 302' do
      expect(response).to have_http_status(302)
    end
  end
end

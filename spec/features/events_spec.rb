require 'rails_helper'

RSpec.describe 'Events' do
  let!(:user) {User.create(email: 'user1@gmail.com', password: 'password')}
  it "shows All Events and nav links" do
    visit new_user_session_path
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content('All Events')
    click_link('Create Event')
    expect(current_path).to eql new_event_path
    expect(page).to have_content('New event')
  end
end
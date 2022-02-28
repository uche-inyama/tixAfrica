require 'rails_helper'

describe 'the signin process', type: :feature do
  before :each do
    User.create(email: 'user1@gmail.com', password: 'password')
  end
  it 'signs in with correct credentials' do
    visit new_user_session_path
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
   expect(current_path).to eq(root_path)
   expect(page).to have_text('Signed in successfully.')
  end

  User.create(email: 'johndoe@gmail.com', password: 'asdf123')

  it 'signs in with incorrect credentials' do
    visit new_user_session_path
    fill_in 'Email', with: 'johndoes@gmail.com'
    fill_in 'Password', with: 'asdf123'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end
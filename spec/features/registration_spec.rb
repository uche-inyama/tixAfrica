require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    scenario "should be successful" do
      visit new_user_registration_path
      within('form') do
        fill_in 'Email', with: 'johndoe@gmail.com'
        fill_in 'Password', with: '1234asdf'
        fill_in 'Password confirmation', with: '1234asdf' 
      end
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully')  
    end

    scenario "should be unsuccessful" do
      visit new_user_registration_path
      within('form') do
        fill_in 'Email', with: 'johndoe@gmail.com'
        fill_in 'Password', with: '1234asdf'
        fill_in 'Password confirmation', with: 'asdf1234'
      end
      click_button 'Sign up'
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end
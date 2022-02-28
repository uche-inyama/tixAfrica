require 'rails_helper'

RSpec.describe 'Home features' do
  it 'it displays homepage' do
    visit root_path
    expect(page).to have_content('I am home')
    expect(page).to have_content("Events")
  end
end
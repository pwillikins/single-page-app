require 'rails_helper'

feature 'The one-page contact manager app' do

  scenario 'The homepage loads', js: true do
    visit '/'
    expect(page).to have_title("Contact Manager")
  end

  scenario 'User views existing people', js: true do
    Person.create!(
      first_name: 'Paul',
      last_name: 'Stone',
      address: 'Broomfield, CO'
    )

    visit '/'
    within '.person' do
      expect(page).to have_content 'Paul Stone'
      expect(page).to have_content 'Broomfield, CO'
    end
  end

end
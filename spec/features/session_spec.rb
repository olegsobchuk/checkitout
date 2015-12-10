require 'rails_helper'

feature 'Session' do
  let(:user) { create(:user) }
  let(:session_page) { SessionPage.new }

  scenario 'Sign In/Out', js: true do
    session_page.open
    expect(page).to have_content('Welcome to Check It Out')
    session_page.login(user.email, 'pass')
    expect(page).to have_content('is invalid')
    session_page.login(user.email, user.password)
    expect(page).to have_content('Log Out')
    find_link('Log Out').click
    expect(page).to have_content('Log In')
  end
end

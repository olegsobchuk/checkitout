require 'support/base_page'

class SessionPage < BasePage
  def open
    visit new_session_path
    self
  end

  def login(email, password)
    fill_in :session_email, with: email
    fill_in :session_password, with: password
    click_button 'Login'
  end
end

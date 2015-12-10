require 'support/base_page'

class UserPage < BasePage
  def open(user)
    visit user_path(user)
    self
  end

  def create_project(title)
    fill_in :project_title, with: title
    click_button 'Save'
  end
end

class BasePage
  include Capybara::DSL
  include Rails.application.routes.url_helpers
end

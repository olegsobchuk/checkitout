module Step
  CONSTANTS = {
    navigating: [:visit],
    clicking: [:click_link, :click_button, :click_on],
    forms: [:fill_in, :choose, :check, :uncheck, :attach_file, :select],
    querying: [:has_selector?, :has_xpath?, :has_css?, :has_content?],
    expectation: [:have, :have_not],
    finding: [:find_field, :find_link, :find_button, :find, :all],
    scoping: [:within, :within_fieldset, :within_table]
  }
end

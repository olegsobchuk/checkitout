module CapybaraMethods
  NODE_METHODS =
    [
      :all, :first, :attach_file, :text, :check, :choose,
      :click_link_or_button, :click_button, :click_link, :field_labeled,
      :fill_in, :find, :find_all, :find_button, :find_by_id, :find_field, :find_link,
      :has_content?, :has_text?, :has_css?, :has_no_content?, :has_no_text?,
      :has_no_css?, :has_no_xpath?, :resolve, :has_xpath?, :select, :uncheck,
      :has_link?, :has_no_link?, :has_button?, :has_no_button?, :has_field?,
      :has_no_field?, :has_checked_field?, :has_unchecked_field?,
      :has_no_table?, :has_table?, :unselect, :has_select?, :has_no_select?,
      :has_selector?, :has_no_selector?, :click_on, :has_no_checked_field?,
      :has_no_unchecked_field?, :query, :assert_selector, :assert_no_selector,
      :refute_selector, :assert_text, :assert_no_text
    ]

  DOCUMENT_METHODS =
    [
      :title, :assert_title, :assert_no_title, :has_title?, :has_no_title?
    ]

  SESSION_METHODS =
    [
      :body, :html, :source, :current_url, :current_host, :current_path,
      :execute_script, :evaluate_script, :visit, :go_back, :go_forward,
      :within, :within_fieldset, :within_table, :within_frame, :current_window,
      :windows, :open_new_window, :switch_to_window, :within_window, :window_opened_by,
      :save_page, :save_and_open_page, :save_screenshot,
      :save_and_open_screenshot, :reset_session!, :response_headers,
      :status_code, :current_scope,
      :assert_current_path, :assert_no_current_path, :has_current_path?, :has_no_current_path?
    ]

  MODAL_METHODS =

    [
      :accept_alert, :accept_confirm, :dismiss_confirm, :accept_prompt,
      :dismiss_prompt
    ]

  DSL_METHODS = NODE_METHODS + SESSION_METHODS + MODAL_METHODS
end

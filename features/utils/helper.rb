class Helper

  def self.switch_to_last_window
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  end

  def self.switch_to_first_window
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
  end

  def self.open_new_tab
    open_new_window
  end

end
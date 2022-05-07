Before do |scenario|
  Driver.get_driver
  page.driver.browser.manage.window.maximize
  puts "SCENARIO Name == #{scenario.name}"
end

After do |scenario|

  if scenario.failed?
    time = Time.new
    time_day = time.strftime("%Y-%m-%d")
    time_hours = time.strftime("%H-%M-%S")
    file_path = "output/screenshots-#{time_day}"

    screenshot = "#{file_path}/#{scenario.name}-#{time_hours}.png"

    page.save_screenshot(screenshot)
    Allure.add_attachment(name: "Fail Screenshot", source: File.open("#{screenshot}"), type: Allure::ContentType::PNG, test_case: true)
    puts "SCENARIO FAILED == #{scenario.name}"
  else
    puts "SCENARIO PASSED == #{scenario.name}"
  end

  Capybara.current_session.driver.quit

end

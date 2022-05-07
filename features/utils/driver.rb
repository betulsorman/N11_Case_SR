class Driver

  def self.get_driver
    type = BaseConfig.browser
    case type
    when 'chrome'
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--disable-popup-blocking')
      options.add_argument('--ignore-certificate-errors')

      Capybara.register_driver :selenium do |config|
        Capybara::Selenium::Driver.new(config,
                                       browser: :chrome,
                                       options: options)
      end
    when 'remote-firefox'
      capabilities = Selenium::WebDriver::Remote::Capabilities.firefox
      Capybara.app_host = "http://127.0.0.1:4444"
      Capybara.run_server = false

      Capybara.register_driver :remote_browser do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser: :remote,
                                       url: "http://localhost:4444/wd/hub",
                                       desired_capabilities: capabilities)
      end
      Capybara.default_driver = :remote_browser
      Capybara.javascript_driver = :remote_browser
    when 'chrome-headless'
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--headless')
      add_default_values(options)

      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser: :chrome,
                                       options: options)
      end
    when 'remote-chrome'
      options = Selenium::WebDriver::Remote::Capabilities.chrome

      Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser: :remote,
                                       url: "http://localhost:4444/wd/hub",
                                       options: options)
      end
    end
  end

  def self.add_default_values(options)
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--ignore-certificate-errors')
  end
end
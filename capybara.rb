Capybara.asset_host = 'http://localhost:3000'

Capybara.register_driver :chrome_headless do |app|
  browser_options = ::Selenium::WebDriver::Chrome::Options.new
  browser_options.args << '--headless'
  browser_options.args << '--disable-gpu'
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :chrome_headless

module SeleniumErrors
  def selenium_errors
    page.driver.browser.manage.logs.get(:browser)
        .select { |e| e.level == 'SEVERE' && e.message.present? }
        .map(&:message)
        .reject { |x| x.match(/Access-Control-Allow-Origin/) }
        .to_a
  end
end

RSpec.configure do |config|
  config.include SeleniumErrors, type: :feature
end

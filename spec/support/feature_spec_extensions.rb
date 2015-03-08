module FeatureSpecExtensions
  def hang
    print "Waiting.... Press return if you wanna continue"

    if ENV['FF'] == 'true'
      STDIN.getc
    else
      page.driver.debug
    end
  end
end

RSpec.configure do |config|
  config.include FeatureSpecExtensions, type: :feature

  config.before :suite, type: :feature do
    if ENV['FF'] == 'true' # in case you wanna run it with selenium
      require 'selenium-webdriver'
    else
      require 'capybara/poltergeist'
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app, {
          js_errors: true,
          inspector: true,
          phantomjs_options: ['--load-images=no', '--ignore-ssl-errors=yes'],
          timeout: 120
        })
      end
    end
  end

  config.before :each, type: :feature do
    Capybara.current_driver = ENV['FF'] == 'true' ? Capybara.javascript_driver : :poltergeist
  end
end

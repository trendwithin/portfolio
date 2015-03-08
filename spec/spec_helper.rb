require 'capybara/rspec'
Dir[Rails.root.join("spec/support/**/*.rb").each { |f| require f }
#Capybara.javascript_driver = ENV['USE_SELENIUM_FOR_CAPYBARA'] ? :selenium : :webkit

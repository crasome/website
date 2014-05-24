module StepHelpers::Drivers
  def with_selenium
    current_driver = Capybara.current_driver
    Capybara.current_driver = :selenium
    yield
    Capybara.current_driver = current_driver
  end

  def with_rack
    current_driver = Capybara.current_driver
    Capybara.current_driver = :rack_test
    yield
    Capybara.current_driver = current_driver
  end
end

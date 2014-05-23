require_relative "drivers"

module DeleteRequestsCucumberHelper
  # Submit an HTTP delete request, using rack_test driver
  def http_delete(path)
    with_rack do
      page.driver.submit :delete, path, {}
    end
  end
end

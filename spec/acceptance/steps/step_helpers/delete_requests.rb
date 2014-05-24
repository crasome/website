require_relative "drivers"

module StepHelpers
  module DeleteRequest
    include StepHelpers::Drivers

    # Submit an HTTP delete request, using rack_test driver
    def http_delete(path)
      with_rack do
        page.driver.submit :delete, path, {}
      end
    end
  end
end

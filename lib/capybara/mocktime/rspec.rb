require 'chronic'

module Capybara
  module Mocktime
    module RSpec

      def travel(time)
        Capybara::Mocktime.reset
        Capybara::Mocktime.travel parse_time(time)
      end

    private

      def parse_time(time)
        time.is_a?(String) ? Chronic.parse(time) : time
      end

    end
  end
end

RSpec.configure do |config|
  config.include Capybara::Mocktime::RSpec

  config.prepend_before(:each) do
    mock_time = self.class.metadata[:mock_time]
    travel mock_time if mock_time
  end

  config.after do
    Capybara::Mocktime.reset
  end
end

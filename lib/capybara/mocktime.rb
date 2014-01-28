require 'capybara'
require 'timecop'

module Capybara
  module Mocktime
    autoload :Configuration, 'capybara/mocktime/configuration'

    class << self
      def configure
        yield configuration
      end

      def configuration
        @configuration ||= Configuration.new
      end

      def travel(*args)
        @mocked = true
        Timecop.travel(*args)
      end

      def reset
        @mocked = false
        Timecop.return
      end

      def advance_sinon(ms)
        Capybara.current_session.execute_script "if (window.clock) { window.clock.tick(#{ms}); }"
      end

      def mocked?
        @mocked
      end

      def render_snippet
        <<-JAVASCRIPT
        <script src="/bower_components/sinon/lib/sinon.js"></script>
        <script src="/bower_components/sinon/lib/sinon/util/fake_timers.js"></script>
        <script>
        window.clock = sinon.useFakeTimers(#{Time.now.to_i * 1000});
        </script>
        JAVASCRIPT
      end
    end
  end
end

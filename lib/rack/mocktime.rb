module Rack
  class Mocktime
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)
      body = inject!(body.to_a.join('')) if mocked?
      [status, headers, body]
    end

  private

    def mocked?
      Capybara::Mocktime.mocked?
    end

    def inject!(body)
      [ body.gsub(/(<\/body>)/, "#{snippet}\\1") ]
    end

    def snippet
      Capybara::Mocktime.render_snippet
    end

  end
end

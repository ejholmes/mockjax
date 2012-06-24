require 'rack'

class Rack::Mockjax
  def initialize(app, options={})
    @app     = app
    @options = options
  end

  def call(env)
    @status, @headers, @body = @app.call(env)
    @body = @body.to_a.join
    insert!
    [@status, @headers, [@body]]
  end

  def insert!
    mocks = ''.tap do |m|
      Mockjax.mocks.each { |mock| m << "$.mockjax(#{mock.to_json});\n" }
    end
    @body.gsub!(/(<\/head>)/, "<script src='#{Mockjax.path_to_js}' type='text/javascript'></script>\n<script>#{mocks}</script>\\1")
    @headers['Content-Length'] = Rack::Utils.bytesize(@body).to_s
  end
end

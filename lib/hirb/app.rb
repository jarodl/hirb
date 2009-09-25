require 'rack'

class Hirb::App
  def initialize(app)
    @app = app
  end

  def call(env)
    r = Rack::Request.new(env)

    if r.path_info =~ /^\/hirb\/eval/
      [200, {"Content-Type" => "text/plain"}, Hirb::Eval.boom_shakalaka(r[:cmd])]
    elsif r.path_info =~ /^\/hirb/
      html = File.read(File.join(File.dirname(__FILE__), "..", "..", "public", "hirb", "index.html"))
      [200, {"Content-Type" => "text/html", "Content-Length" => html.size.to_s}, html]
    else
      @app.call(env)
    end
  end
end


require 'rack'

class Hirb::App
  class << self
    def call(env)
      r = Rack::Request.new(env)

      if r.path_info =~ /^\/hirb\/eval/
        [200, {"Content-Type" => "text/plain"}, Hirb::Eval.eval(r[:cmd])]
      #elsif r.path_info =~ /^\/hirb/
      else
        [404, {"Content-Type" => "text/html"}, "Not Found"]
      end
    end
  end
end


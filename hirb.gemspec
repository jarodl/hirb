
Gem::Specification.new do |s|
  s.name = "hirb"
  s.version = "0.1.1"

  s.authors = ["Justin Camerer"]
  s.email = "iamjwc@gmail.com"
  s.summary = "hirb is irb over http"
  s.date = "2009-09-25"

  s.files = ["lib/hirb.rb", "lib/hirb/app.rb", "lib/hirb/eval.rb", "public/hirb/index.html"]
  s.require_paths = ["lib"]

  s.add_dependency('rack', '>= 0')
  s.add_dependency('json', '>= 0')
end


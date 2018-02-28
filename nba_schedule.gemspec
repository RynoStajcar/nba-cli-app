
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nba_schedule/version"

Gem::Specification.new do |spec|
  spec.name          = "nba_schedule"
  spec.version       = NbaSchedule::VERSION
  spec.authors       = ["'Ryne Stajcar'"]
  spec.email         = ["'rynostajcar@gmail.com'"]

  spec.summary       = "Use to grab quick game data for the upcoming 7 game days as well as pulling team starting line up."
  spec.description   = "Grabs NBA game schedule for the next week, and displays games going on per day. Team class also provides scraping from ESPN and gives a current updated line up of the team you type in. Gem can easily be extended to
                        other sports by changing the #get_page nokogiri link to another page."
  spec.homepage      = "https://github.com/RynoStajcar/nba-cli-app"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.11.3"
  #spec.add_development_dependency "nokogiri", ">=0"
  #spec.add_development_dependency "open_uri_redirections", "~> 0.2.1"

end

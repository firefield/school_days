# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "school_days"

Gem::Specification.new do |s|
  s.name        = "school_days"
  s.version     = SchoolDays::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Wilcox", "Ashish Tonse"]
  s.email       = ["ashish.tonse@gmail.com"]
  s.homepage    = "http://github.com/abatish/school_days"
  s.summary     = %q{Calculate relative dates taking a school calendar into account}
  s.description = %q{Calculate relative dates taking a school calendar into account}

  s.rubyforge_project = "school_days"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

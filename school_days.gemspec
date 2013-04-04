$:.push File.expand_path("../lib", __FILE__)
require "school_days"

Gem::Specification.new do |s|
  s.name        = "school_days"
  s.version     = SchoolDays::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Wilcox", "Ashish Tonse", "Claudio Perez Gamayo"]
  s.email       = ["claudio@firefield.com"]
  s.homepage    = "http://github.com/crossblaim/school_days"
  s.summary     = %q{Calculate relative dates taking a school calendar into account}
  s.description = %q{Calculate relative dates taking a school calendar into account}
  s.files       = `git ls-files -- {lib,rails_generators,tasks}`.split("\n")
  s.files      += [ "History.txt",
                    "Manifest.txt",
                    "PostInstall.txt",
                    "README.rdoc",
                    "LICENSE",
                    "Rakefile",
                    "school_days.gemspec",
                    "tasks/stats.rake"
                  ]
  s.test_files    = `git ls-files -- test`.split("\n")
  s.require_paths = ["lib"]
  s.add_dependency('activesupport','>= 3.2.12')
  s.add_development_dependency "rake", ">= 0.9.2"
  s.add_development_dependency "shoulda", ">= 0"
  s.add_development_dependency "rdoc", ">= 0"
end

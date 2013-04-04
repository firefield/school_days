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

  #s.rubyforge_project = "school_days"

  s.files         = [ "History.txt",
                      "Manifest.txt",
                      "PostInstall.txt",
                      "README.rdoc",
                      "Rakefile",
                      "school_days.gemspec",
                      "lib/extensions/date.rb",
                      "lib/extensions/fixnum.rb",
                      "lib/school_days.rb",
                      "lib/school_days/calculator.rb",
                      "lib/school_days/calendar.rb",
                      "lib/school_days/config.rb",
                      "rails_generators/school_days_config/USAGE",
                      "rails_generators/school_days_config/school_days_config_generator.rb",
                      "rails_generators/school_days_config/templates/school_days.rb",
                      "rails_generators/school_days_config/templates/school_days.yml",
                      "tasks/stats.rake"
                    ]
  s.test_files    = [ "test/fixtures/double_session_test.yml",
                      "test/fixtures/invalid_config_test.yml",
                      "test/fixtures/simple_test.yml",
                      "test/test_config.rb",
                      "test/test_date_extensions.rb",
                      "test/test_fixnum_extensions.rb",
                      "test/test_generator_helper.rb",
                      "test/test_helper.rb",
                      "test/test_school_days.rb",
                      "test/test_school_days_calculator.rb",
                      "test/test_school_days_config_generator.rb"]
  s.require_paths = ["lib"]
end

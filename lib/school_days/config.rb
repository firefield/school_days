require 'singleton'
require 'yaml'
require 'date'

module SchoolDays
  class Config
    include Singleton

    attr_reader :calendars

    def initialize
      # used this block syntax because we want the default to be lazy loaded
      @calendars = Hash.new { |hash, key| default_calendar }
    end

    def default_calendar
      @calendars['default']
    end

    def load(filename)
      data = YAML::load(File.open(filename))
      data['school_days'].keys.each do |calendar_name|
        load_calendar(data['school_days'][calendar_name], calendar_name)
      end
    end

    def load_calendar(calendar_data, calendar_name)
      @calendars[calendar_name] = Calendar.new(calendar_data, calendar_name)
    end
  end

  def self.config
    Config.instance
  end
end

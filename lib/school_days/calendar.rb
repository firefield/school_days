module SchoolDays
  class Calendar
    attr_reader :school_sessions
    attr_reader :holiday_exceptions
    attr_reader :included_day_exceptions
    attr_reader :name

    def initialize(data, name = 'default')
      @name = name
      @school_sessions = {}
      @holiday_exceptions = []
      @included_day_exceptions = []

      load data
    end

    def school_year_start
      res = @school_sessions.min do |a, b|
        a[:start_date] <=> b[:start_date]
      end
      res[:start_date]
    end

    def school_year_end
      res = @school_sessions.max do |a, b|
        a[:end_date] <=> b[:end_date]
      end
      res[:end_date]
    end

    def add_holiday(date)
      @holiday_exceptions << parse_date(date)
    end

    def add_included_day(date)
      @included_day_exceptions << parse_date(date)
    end

    def add_school_session(start_date, end_date)
      @school_sessions << {
                            :start_date => parse_date(start_date),
                            :end_date => parse_date(end_date)
                          }
    end

private
    def parse_date(date)
      if date.is_a? String
        Date.parse(date)
      elsif date.is_a? Date
        date
      end
    end

    def load(data)
      sessions = data["school_sessions"] || {}

      @school_sessions = sessions.collect do |session_name, session_value|
        if session_value["start_date"].nil? || session_value["end_date"].nil?
          raise "start_date or end_date is blank for #{session_name} in #{filename}"
        end

        {
          :start_date => Date.parse(session_value["start_date"]),
          :end_date   => Date.parse(session_value["end_date"])
        }
      end

      if data['exceptions']
        data["exceptions"]["holidays"].each { |holiday| @holiday_exceptions << Date.parse(holiday) } if data['exceptions']['holidays']
        data["exceptions"]["included_days"].each { |extra_day| @included_day_exceptions << Date.parse(extra_day) } if data['exceptions']['included_days']
      end

    end
  end
end
